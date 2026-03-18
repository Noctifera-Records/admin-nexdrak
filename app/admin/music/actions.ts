"use server";

import { auth } from "@/lib/auth";
import { withDb } from "@/lib/db";
import { headers } from "next/headers";
import { revalidatePath } from "next/cache";
import { z } from "zod";

const songSchema = z.object({
  title: z.string().min(1, "Title is required"),
  artist: z.string().min(1, "Artist is required"),
  album_name: z.string().optional().nullable(),
  cover_image_url: z.string().url().optional().nullable().or(z.literal("")),
  release_date: z.string().optional().nullable().or(z.literal("")),
  type: z.enum(["album", "single"]),
  slug: z.string().optional().nullable(),
  stream_url: z.string().url("Invalid streaming URL").optional().nullable().or(z.literal("")),
  youtube_embed_id: z.string().optional().nullable(),
  track_number: z.number().int().min(1).optional().nullable()
});

const streamingLinkSchema = z.object({
  platform: z.string().min(1),
  url: z.string().url(),
  is_primary: z.boolean()
});

export async function getSongs() {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        const res = await db.query(`
            SELECT s.*, 
                   json_agg(
                       json_build_object(
                           'id', sl.id, 
                           'platform', sl.platform, 
                           'url', sl.url, 
                           'is_primary', sl.is_primary
                       ) ORDER BY sl.is_primary DESC
                   ) FILTER (WHERE sl.id IS NOT NULL) as streaming_links
            FROM songs s
            LEFT JOIN streaming_links sl ON s.id = sl.song_id
            GROUP BY s.id
            ORDER BY s.release_date DESC NULLS FIRST, s.created_at DESC
        `);

        return res.rows;
    });
}

export async function createSong(data: unknown) {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        const result = songSchema.safeParse(data);
        if (!result.success) {
            throw new Error(result.error.issues[0].message);
        }

        const { title, artist, album_name, cover_image_url, release_date, type, slug, stream_url, youtube_embed_id, track_number } = result.data;

        // Clean data: convert empty strings to null for optional fields
        const clean_release_date = release_date && release_date.trim() !== "" ? release_date : null;
        const clean_cover_image_url = cover_image_url && cover_image_url.trim() !== "" ? cover_image_url : null;
        const clean_album_name = album_name && album_name.trim() !== "" ? album_name : null;
        const clean_slug = slug && slug.trim() !== "" ? slug : null;
        const clean_stream_url = stream_url && stream_url.trim() !== "" ? stream_url : null;
        const clean_youtube_embed_id = youtube_embed_id && youtube_embed_id.trim() !== "" ? youtube_embed_id : null;
        const clean_track_number = (type === "album" && track_number) ? track_number : null;

        const res = await db.query(`
            INSERT INTO songs (title, artist, album_name, cover_image_url, release_date, type, slug, stream_url, youtube_embed_id, track_number)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
            RETURNING *
        `, [title.trim(), artist.trim(), clean_album_name, clean_cover_image_url, clean_release_date, type, clean_slug, clean_stream_url, clean_youtube_embed_id, clean_track_number]);

        revalidatePath("/admin/music");
        return res.rows[0];
    });
}

export async function updateSong(id: number, data: unknown) {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        const result = songSchema.safeParse(data);
        if (!result.success) {
            throw new Error(result.error.issues[0].message);
        }

        const { title, artist, album_name, cover_image_url, release_date, type, slug, stream_url, youtube_embed_id, track_number } = result.data;

        // Clean data: convert empty strings to null for optional fields
        const clean_release_date = release_date && release_date.trim() !== "" ? release_date : null;
        const clean_cover_image_url = cover_image_url && cover_image_url.trim() !== "" ? cover_image_url : null;
        const clean_album_name = album_name && album_name.trim() !== "" ? album_name : null;
        const clean_slug = slug && slug.trim() !== "" ? slug : null;
        const clean_stream_url = stream_url && stream_url.trim() !== "" ? stream_url : null;
        const clean_youtube_embed_id = youtube_embed_id && youtube_embed_id.trim() !== "" ? youtube_embed_id : null;
        const clean_track_number = (type === "album" && track_number) ? track_number : null;

        const res = await db.query(`
            UPDATE songs 
            SET title = $1, artist = $2, album_name = $3, cover_image_url = $4, release_date = $5, type = $6, slug = $7, stream_url = $8, youtube_embed_id = $9, track_number = $10, updated_at = NOW()
            WHERE id = $11
            RETURNING *
        `, [title.trim(), artist.trim(), clean_album_name, clean_cover_image_url, clean_release_date, type, clean_slug, clean_stream_url, clean_youtube_embed_id, clean_track_number, id]);

        revalidatePath("/admin/music");
        return res.rows[0];
    });
}

export async function deleteSong(id: number) {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        await db.query("DELETE FROM songs WHERE id = $1", [id]);
        revalidatePath("/admin/music");
        return { success: true };
    });
}

// Streaming Links Actions
export async function addStreamingLink(songId: number, data: unknown) {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        const result = streamingLinkSchema.safeParse(data);
        if (!result.success) {
            throw new Error(result.error.issues[0].message);
        }

        const { platform, url, is_primary } = result.data;

        if (is_primary) {
            // Reset primary for this song
            await db.query("UPDATE streaming_links SET is_primary = false WHERE song_id = $1", [songId]);
        }

        const res = await db.query(`
            INSERT INTO streaming_links (song_id, platform, url, is_primary)
            VALUES ($1, $2, $3, $4)
            RETURNING *
        `, [songId, platform, url, is_primary]);

        revalidatePath("/admin/music");
        return res.rows[0];
    });
}

export async function deleteStreamingLink(id: number) {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        await db.query("DELETE FROM streaming_links WHERE id = $1", [id]);
        revalidatePath("/admin/music");
        return { success: true };
    });
}

export async function setPrimaryStreamingLink(id: number, songId: number) {
    return withDb(async (db) => {
        const session = await auth.api.getSession({
            headers: await headers()
        });

        if (!session || session.user.role !== "admin") {
            throw new Error("Unauthorized");
        }

        // Reset all for this song
        await db.query("UPDATE streaming_links SET is_primary = false WHERE song_id = $1", [songId]);
        
        // Set new primary
        const res = await db.query(`
            UPDATE streaming_links 
            SET is_primary = true 
            WHERE id = $1
            RETURNING *
        `, [id]);

        revalidatePath("/admin/music");
        return res.rows[0];
    });
}
