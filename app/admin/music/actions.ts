"use server";

import { getAdminSession } from "@/lib/auth-guard";
import { withDb } from "@/lib/db";
import { safeRevalidate } from "@/lib/revalidate";
import { z } from "zod";

/**
 * ---------------------------------------------------------------------------
 * Result contract
 * ---------------------------------------------------------------------------
 * Mutations RETURN `{ success: false, error }` instead of throwing. In a
 * production build Next.js replaces the message of any error thrown inside a
 * Server Action with the opaque "An error occurred in the Server Components
 * render..." text, which is exactly what users used to see when saving a song.
 * Returning a value keeps the real message visible in the UI.
 */
export type ActionResult<T> = { success: true; data: T } | { success: false; error: string };

/** Maps low level database errors to messages a human can act on. */
function describeError(error: unknown, fallback: string): string {
    const message = error instanceof Error ? error.message : String(error);
    const code = (error as { code?: string } | null)?.code;

    if (code === "23505" || /duplicate key value/i.test(message)) {
        if (/slug/i.test(message)) {
            return "That slug is already in use by another song. Please choose a different one.";
        }
        return "That record already exists (duplicate value).";
    }

    if (code === "23503" || /foreign key constraint/i.test(message)) {
        return "This song is referenced by other records and cannot be changed right now.";
    }

    if (code === "23514" || /violates check constraint/i.test(message)) {
        return "One of the values is not allowed (check the song type: album or single).";
    }

    if (/Body exceeded|body size/i.test(message)) {
        return "The submitted data is too large. Please use a smaller image or paste an image URL instead.";
    }

    if (/Unauthorized/i.test(message)) {
        return "Your session has expired. Please sign in again.";
    }

    if (/Database connection failed|ECONNREFUSED|terminating connection/i.test(message)) {
        return "Could not reach the database. Please try again in a moment.";
    }

    return fallback;
}

function failure(error: unknown, fallback: string): ActionResult<never> {
    console.error("[music] action failed:", error);
    return { success: false, error: describeError(error, fallback) };
}

/**
 * ---------------------------------------------------------------------------
 * Date helpers
 * ---------------------------------------------------------------------------
 * The Neon/Supabase driver returns `date` columns as JavaScript `Date`
 * objects, and React serialises them back to the client as `Date` too. Sending
 * a `Date` back to a Server Action used to fail Zod validation and produced the
 * reported crash, so every date crossing this boundary is normalised to the
 * `YYYY-MM-DD` string that <input type="date"> understands.
 */
function toDateOnly(value: unknown): string | null {
    if (value === null || value === undefined || value === "") return null;

    if (value instanceof Date) {
        return Number.isNaN(value.getTime()) ? null : value.toISOString().slice(0, 10);
    }

    if (typeof value !== "string") return null;

    const raw = value.trim();
    if (!raw) return null;

    const iso = /^(\d{4})-(\d{2})-(\d{2})/.exec(raw);
    if (iso) return `${iso[1]}-${iso[2]}-${iso[3]}`;

    const parsed = new Date(raw);
    return Number.isNaN(parsed.getTime()) ? null : parsed.toISOString().slice(0, 10);
}

function toIsoString(value: unknown): string | null {
    if (!value) return null;
    const parsed = value instanceof Date ? value : new Date(String(value));
    return Number.isNaN(parsed.getTime()) ? null : parsed.toISOString();
}

/** Normalises a `songs` row so the client never receives a `Date` instance. */
function serializeSong(row: Record<string, any> | null | undefined) {
    if (!row) return null;
    return {
        ...row,
        release_date: toDateOnly(row.release_date),
        created_at: toIsoString(row.created_at),
        updated_at: toIsoString(row.updated_at),
    };
}

const songSchema = z.object({
    title: z.string().min(1, "Title is required"),
    artist: z.string().min(1, "Artist is required"),
    album_name: z.string().optional().nullable(),
    cover_image_url: z.string().url().optional().nullable().or(z.literal("")),
    // Accepts "YYYY-MM-DD", a full ISO string or a Date instance.
    release_date: z.union([z.string(), z.date()]).nullish(),
    type: z.enum(["album", "single"]),
    slug: z.string().optional().nullable(),
    stream_url: z.string().url("Invalid streaming URL").optional().nullable().or(z.literal("")),
    youtube_embed_id: z.string().optional().nullable(),
    track_number: z.number().int().min(1).optional().nullable()
});

const streamingLinkSchema = z.object({
    platform: z.string().min(1, "Platform is required"),
    url: z.string().url("Invalid streaming URL"),
    is_primary: z.boolean()
});

/** Turns raw form input into the exact values the INSERT/UPDATE statements need. */
function normalizeSongInput(data: z.infer<typeof songSchema>) {
    const clean = (value?: string | null) =>
        value && value.trim() !== "" ? value.trim() : null;

    return {
        title: data.title.trim(),
        artist: data.artist.trim(),
        album_name: clean(data.album_name),
        cover_image_url: clean(data.cover_image_url),
        release_date: toDateOnly(data.release_date),
        type: data.type,
        slug: clean(data.slug),
        stream_url: clean(data.stream_url),
        youtube_embed_id: clean(data.youtube_embed_id),
        track_number: data.type === "album" && data.track_number ? data.track_number : null,
    };
}

function parseSong(data: unknown) {
    const result = songSchema.safeParse(data);
    if (!result.success) {
        const issue = result.error.issues[0];
        const field = issue.path.length ? `${issue.path.join(".")}: ` : "";
        throw new Error(`${field}${issue.message}`);
    }
    return normalizeSongInput(result.data);
}


// ---------------------------------------------------------------------------
// Queries
// ---------------------------------------------------------------------------

export async function getSongs(): Promise<any[]> {
    await getAdminSession();

    return withDb(async (db) => {
        const res = await db.rawQuery(`
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

        return res.rows.map(serializeSong);
    });
}

// ---------------------------------------------------------------------------
// Mutations
// ---------------------------------------------------------------------------

export async function createSong(data: unknown): Promise<ActionResult<any>> {
    try {
        await getAdminSession();
        const song = parseSong(data);

        return await withDb(async (db) => {
            const res = await db.rawQuery(`
                INSERT INTO songs (title, artist, album_name, cover_image_url, release_date, type, slug, stream_url, youtube_embed_id, track_number)
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
                RETURNING *
            `, [
                song.title, song.artist, song.album_name, song.cover_image_url,
                song.release_date, song.type, song.slug, song.stream_url,
                song.youtube_embed_id, song.track_number,
            ]);

            safeRevalidate("/admin/music");
            return { success: true as const, data: serializeSong(res.rows[0]) };
        });
    } catch (error) {
        return failure(error, "Could not create the song.");
    }
}

export async function updateSong(id: number, data: unknown): Promise<ActionResult<any>> {
    try {
        await getAdminSession();

        if (!Number.isFinite(id)) {
            return { success: false, error: "Invalid song id." };
        }

        const song = parseSong(data);

        return await withDb(async (db) => {
            const res = await db.rawQuery(`
                UPDATE songs 
                SET title = $1, artist = $2, album_name = $3, cover_image_url = $4, release_date = $5, type = $6, slug = $7, stream_url = $8, youtube_embed_id = $9, track_number = $10, updated_at = NOW()
                WHERE id = $11
                RETURNING *
            `, [
                song.title, song.artist, song.album_name, song.cover_image_url,
                song.release_date, song.type, song.slug, song.stream_url,
                song.youtube_embed_id, song.track_number, id,
            ]);

            if (!res.rows[0]) {
                return { success: false as const, error: "Song not found." };
            }

            safeRevalidate("/admin/music");
            return { success: true as const, data: serializeSong(res.rows[0]) };
        });
    } catch (error) {
        return failure(error, "Could not update the song.");
    }
}


export async function deleteSong(id: number): Promise<ActionResult<{ id: number }>> {
    try {
        await getAdminSession();

        return await withDb(async (db) => {
            // `streaming_links.song_id` has ON DELETE CASCADE, so the links that
            // belong to the song are removed automatically.
            await db.rawQuery("DELETE FROM songs WHERE id = $1", [id]);

            safeRevalidate("/admin/music");
            return { success: true as const, data: { id } };
        });
    } catch (error) {
        return failure(error, "Could not delete the song.");
    }
}

// ---------------------------------------------------------------------------
// Streaming links
// ---------------------------------------------------------------------------

export async function addStreamingLink(songId: number, data: unknown): Promise<ActionResult<any>> {
    try {
        await getAdminSession();

        const result = streamingLinkSchema.safeParse(data);
        if (!result.success) {
            return { success: false, error: result.error.issues[0]?.message || "Invalid streaming link." };
        }

        const { platform, url, is_primary } = result.data;

        return await withDb(async (db) => {
            if (is_primary) {
                await db.rawQuery("UPDATE streaming_links SET is_primary = false WHERE song_id = $1", [songId]);
            }

            const res = await db.rawQuery(`
                INSERT INTO streaming_links (song_id, platform, url, is_primary)
                VALUES ($1, $2, $3, $4)
                RETURNING id, song_id, platform, url, is_primary
            `, [songId, platform, url, is_primary]);

            safeRevalidate("/admin/music");
            return { success: true as const, data: res.rows[0] };
        });
    } catch (error) {
        return failure(error, "Could not add the streaming link.");
    }
}

export async function deleteStreamingLink(id: number): Promise<ActionResult<{ id: number }>> {
    try {
        await getAdminSession();

        return await withDb(async (db) => {
            await db.rawQuery("DELETE FROM streaming_links WHERE id = $1", [id]);

            safeRevalidate("/admin/music");
            return { success: true as const, data: { id } };
        });
    } catch (error) {
        return failure(error, "Could not delete the streaming link.");
    }
}

export async function setPrimaryStreamingLink(id: number, songId: number): Promise<ActionResult<any>> {
    try {
        await getAdminSession();

        return await withDb(async (db) => {
            await db.rawQuery("UPDATE streaming_links SET is_primary = false WHERE song_id = $1", [songId]);

            const res = await db.rawQuery(`
                UPDATE streaming_links 
                SET is_primary = true 
                WHERE id = $1
                RETURNING id, song_id, platform, url, is_primary
            `, [id]);

            safeRevalidate("/admin/music");
            return { success: true as const, data: res.rows[0] };
        });
    } catch (error) {
        return failure(error, "Could not set the primary streaming link.");
    }
}

