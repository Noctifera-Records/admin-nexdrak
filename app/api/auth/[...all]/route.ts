import { getAuth } from "@/lib/auth";
import { withDb } from "@/lib/db";

/**
 * Every auth request runs inside `withDb`, so the Postgres connection used by
 * Better Auth is always closed before the request ends. Keeping a WebSocket
 * open across requests is what produced random sign-in/sign-out failures on
 * Cloudflare Workers ("Cannot perform I/O on behalf of a different request").
 */
export const GET = async (req: Request) => {
  try {
    return await withDb((db) => getAuth(db).handler(req));
  } catch (error: any) {
    console.error("[Auth Route GET] Error:", error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }
};

export const POST = async (req: Request) => {
  try {
    return await withDb((db) => getAuth(db).handler(req));
  } catch (error: any) {
    console.error("[Auth Route POST] Error:", error);
    return new Response(JSON.stringify({ 
      error: "Internal Server Error", 
      message: error.message 
    }), { 
      status: 500,
      headers: { "Content-Type": "application/json" }
    });
  }
};

export const ALL = async (req: Request) => {
  return await withDb((db) => getAuth(db).handler(req));
};
