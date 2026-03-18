"use server";

import { getAuth } from "@/lib/auth";
import { withDb } from "@/lib/db";
import { headers } from "next/headers";
import { revalidatePath } from "next/cache";

export async function getSiteSettings() {
    const session = await getAuth().api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    return await withDb(async (db) => {
        const res = await db.query(`
            SELECT key, value FROM site_settings ORDER BY key
        `);
        return res.rows;
    });
}

export async function updateSiteSettings(settings: Record<string, string>) {
    const session = await getAuth().api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    const updates = Object.entries(settings).map(([key, value]) => ({
        key,
        value: value?.trim() || ''
    }));

    try {
        await withDb(async (db) => {
            await db.query("BEGIN");
            try {
                for (const { key, value } of updates) {
                    // Check if key exists
                    const check = await db.query("SELECT key FROM site_settings WHERE key = $1", [key]);
                    
                    if (check.rows.length > 0) {
                        await db.query("UPDATE site_settings SET value = $1, updated_at = NOW() WHERE key = $2", [value, key]);
                    } else {
                        await db.query("INSERT INTO site_settings (key, value) VALUES ($1, $2)", [key, value]);
                    }
                }
                await db.query("COMMIT");
            } catch (error) {
                await db.query("ROLLBACK");
                throw error;
            }
        });

        revalidatePath("/admin/settings");
        revalidatePath("/"); // Update home page as well since it uses these settings
        return { success: true };
    } catch (error: any) {
        console.error("Error updating site settings:", error);
        throw new Error("Failed to update settings");
    }
}
