"use server";

import { withDb } from "@/lib/db";
import { getAdminSession } from "@/lib/auth-guard";
import { safeRevalidate } from "@/lib/revalidate";

export async function getUsers() {
  await getAdminSession();

  // Fetch users from Better Auth 'user' table
  // Columns match backup.sql: created_at, email_verified
  return await withDb(async (db) => {
    const res = await db.rawQuery(`
      SELECT id, email, name as username, role, created_at, email_verified as email_confirmed_at 
      FROM "user"
      ORDER BY created_at DESC
    `);
    return res.rows;
  });
}

export async function updateUserProfile(userId: string, updates: { role?: string, username?: string }) {
  // Keeps the original contract: this action reports problems by returning an
  // object instead of throwing.
  try {
    await getAdminSession();
  } catch {
    return { error: "Unauthorized" };
  }

  try {
    const { role, username } = updates;
    
    // Construct dynamic update query
    const fields: string[] = [];
    const values: (string | number)[] = [];
    let paramIndex = 1;

    if (role) {
      fields.push(`role = $${paramIndex++}`);
      values.push(role);
    }
    if (username) {
      fields.push(`name = $${paramIndex++}`);
      values.push(username);
    }

    if (fields.length === 0) return { success: true };

    values.push(userId); // Add userId as last parameter

    await withDb(async (db) => {
      await db.rawQuery(`
        UPDATE "user"
        SET ${fields.join(", ")}, updated_at = NOW()
        WHERE id = $${paramIndex}
      `, values);
    });

    safeRevalidate("/admin/users");
    return { success: true };
  } catch (error: any) {
    console.error("Error updating user:", error);
    return { error: error.message };
  }
}

export async function deleteUser(userId: string) {
  const session = await getAdminSession().catch(() => null);
  if (!session) {
    return { error: "Unauthorized" };
  }

  // Prevent deleting self
  if (session.user.id === userId) {
    return { error: "Cannot delete your own account" };
  }

  try {
    // Better Auth handles cascading deletes usually, but we delete from 'user' table directly
    await withDb(async (db) => {
      await db.rawQuery('DELETE FROM "user" WHERE id = $1', [userId]);
    });
    
    safeRevalidate("/admin/users");
    return { success: true };
  } catch (error: any) {
    console.error("Error deleting user:", error);
    return { error: error.message };
  }
}
