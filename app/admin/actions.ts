'use server';

import { db } from "@/lib/db";
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
        return await db.withConnection(async (client) => {
            const [
                usersCount,
                songsCount,
                merchCount,
                downloadsCount,
                eventsCount,
                releasesCount
            ] = await Promise.all([
                client.query('SELECT COUNT(*) FROM "user"'),
                client.query('SELECT COUNT(*) FROM songs'),
                client.query('SELECT COUNT(*) FROM merch'),
                client.query('SELECT COUNT(*) FROM downloads'),
                client.query('SELECT COUNT(*) FROM events'),
                client.query('SELECT COUNT(*) FROM releases')
            ]);

            return {
                users: parseInt(usersCount.rows[0].count),
                songs: parseInt(songsCount.rows[0].count),
                merch: parseInt(merchCount.rows[0].count),
                downloads: parseInt(downloadsCount.rows[0].count),
                events: parseInt(eventsCount.rows[0].count),
                releases: parseInt(releasesCount.rows[0].count)
            };
        });
    } catch (error) {
        console.error("Error fetching admin stats:", error);
        throw new Error("Failed to fetch stats");
    }
}
