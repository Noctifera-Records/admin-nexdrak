'use server';

import { withDb } from "@/lib/db";
import { getAuth } from "@/lib/auth";
import { headers } from "next/headers";

export async function getAdminStats() {
    const session = await getAuth().api.getSession({
        headers: await headers()
    });

    if (!session || session.user.role !== "admin") {
        throw new Error("Unauthorized");
    }

    try {
        return await withDb(async (db) => {
            const res = await db.rawQuery(`
                SELECT
                    (SELECT COUNT(*) FROM "user") AS users,
                    (SELECT COUNT(*) FROM songs) AS songs,
                    (SELECT COUNT(*) FROM merch) AS merch,
                    (SELECT COUNT(*) FROM downloads) AS downloads,
                    (SELECT COUNT(*) FROM events) AS events,
                    (SELECT COUNT(*) FROM releases) AS releases
            `);

            const row = res.rows[0];
            return {
                users: parseInt(row.users),
                songs: parseInt(row.songs),
                merch: parseInt(row.merch),
                downloads: parseInt(row.downloads),
                events: parseInt(row.events),
                releases: parseInt(row.releases)
            };
        });
    } catch (error) {
        console.error("Error fetching admin stats:", error);
        throw new Error("Failed to fetch stats");
    }
}
