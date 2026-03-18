import { withDb } from "@/lib/db";
import { NextResponse } from "next/server";

export const runtime = "edge";

export async function GET() {
  return withDb(async (db) => {
      try {
          const res = await db.rawQuery(`
              SELECT key, value FROM site_settings
          `);
      
      return NextResponse.json(res.rows);
    } catch (error: any) {
      console.error("API Settings Error:", error);
      return NextResponse.json({ error: "Failed to fetch settings" }, { status: 500 });
    }
  });
}
