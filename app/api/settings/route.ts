import { withDb } from "@/lib/db";
import { NextResponse } from "next/server";

export const runtime = "edge";

export async function GET() {
  return withDb(async (db) => {
    try {
      const res = await db.query(`
        SELECT key, value FROM site_settings ORDER BY key
      `);
      
      return NextResponse.json(res.rows);
    } catch (error: any) {
      console.error("API Settings Error:", error);
      return NextResponse.json({ error: "Failed to fetch settings" }, { status: 500 });
    }
  });
}
