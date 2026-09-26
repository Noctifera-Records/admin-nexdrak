import { headers } from "next/headers";
import { getAuth } from "./auth";
import { withDb } from "./db";

export interface AdminUser {
  id: string;
  name?: string | null;
  email: string;
  image?: string | null;
  role?: string | null;
}

export interface AdminSession {
  session: Record<string, unknown>;
  user: AdminUser;
}

/**
 * Reads the current Better Auth session.
 *
 * The lookup runs inside `withDb`, so the Postgres/WebSocket connection is
 * ALWAYS closed before the request finishes. This is what prevents the
 * "Cannot perform I/O on behalf of a different request" errors that used to
 * surface as an opaque "An error occurred in the Server Components render"
 * message (Cloudflare Workers cannot keep a socket open between requests).
 *
 * Returns `null` when there is no valid session; never throws for that case.
 */
export async function getSessionFromDb(): Promise<AdminSession | null> {
  const requestHeaders = await headers();

  return withDb(async (db) => {
    const session = await getAuth(db).api.getSession({ headers: requestHeaders });
    return (session ?? null) as AdminSession | null;
  });
}

/**
 * Same as getSessionFromDb but throws a clear error when the caller is not an
 * admin. Use it in Server Actions (mutations and admin-only queries).
 */
export async function getAdminSession(): Promise<AdminSession> {
  const session = await getSessionFromDb();

  if (!session) {
    throw new Error("Unauthorized: no active session found");
  }

  if (session.user.role !== "admin") {
    throw new Error("Unauthorized: admin access required");
  }

  return session;
}

/** Convenience wrapper when the session object itself is not needed. */
export async function assertAdmin(): Promise<void> {
  await getAdminSession();
}
