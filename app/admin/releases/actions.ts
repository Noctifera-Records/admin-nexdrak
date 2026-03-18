"use server";

import { auth } from "@/lib/auth";
import { withDb } from "@/lib/db";
import { headers } from "next/headers";
import { revalidatePath } from "next/cache";

export async function getReleases() {
    const session = await auth.api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    return await withDb(async (db) => {
        const res = await db.query(`
            SELECT * FROM releases ORDER BY release_date DESC
        `);
        return res.rows;
    });
}

export async function createRelease(data: any) {
    const session = await auth.api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    const { title, release_date, cover_image_url, stream_url } = data;

    return await withDb(async (db) => {
        const res = await db.query(`
            INSERT INTO releases (title, release_date, cover_image_url, stream_url)
            VALUES ($1, $2, $3, $4)
            RETURNING *
        `, [
            title, 
            release_date, 
            cover_image_url || null, 
            stream_url || null
        ]);

        revalidatePath("/admin/releases");
        return res.rows[0];
    });
}

export async function updateRelease(id: number, data: any) {
    const session = await auth.api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    const { title, release_date, cover_image_url, stream_url } = data;

    return await withDb(async (db) => {
        const res = await db.query(`
            UPDATE releases 
            SET title = $1, release_date = $2, cover_image_url = $3, stream_url = $4
            WHERE id = $5
            RETURNING *
        `, [
            title, 
            release_date, 
            cover_image_url || null, 
            stream_url || null, 
            id
        ]);

        revalidatePath("/admin/releases");
        return res.rows[0];
    });
}

export async function deleteRelease(id: number) {
    const session = await auth.api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    await withDb(async (db) => {
        await db.query("DELETE FROM releases WHERE id = $1", [id]);
    });
    
    revalidatePath("/admin/releases");
    return { success: true };
}
