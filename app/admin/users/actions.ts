"use server";

import { db } from "@/lib/db";
import { getAuth } from "@/lib/auth";
import { headers } from "next/headers";
import { revalidatePath } from "next/cache";

export async function getUsers() {
  const session = await getAuth().api.getSession({
    headers: await headers()
  });

  if (!session || session.user.role !== "admin") {
    throw new Error("Unauthorized");
  }

  // Fetch users from Better Auth 'user' table
  // Columns match backup.sql: created_at, email_verified
  const res = await db.query(`
    SELECT id, email, name as username, role, created_at, email_verified as email_confirmed_at 
    FROM "user"
    ORDER BY created_at DESC
  `);

  return res.rows;
}

export async function updateUserProfile(userId: string, updates: { role?: string, username?: string }) {
  const session = await getAuth().api.getSession({
    headers: await headers()
  });

  if (!session || session.user.role !== "admin") {
    return { error: "Unauthorized" };
  }

  try {
    const { role, username } = updates;
    
    // Construct dynamic update query
    const fields = [];
    const values = [];
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

    await db.query(`
      UPDATE "user"
      SET ${fields.join(", ")}, updated_at = NOW()
      WHERE id = $${paramIndex}
    `, values);

    revalidatePath("/admin/users");
    return { success: true };
  } catch (error: any) {
    console.error("Error updating user:", error);
    return { error: error.message };
  }
}

export async function deleteUser(userId: string) {
  const session = await getAuth().api.getSession({
    headers: await headers()
  });

  if (!session || session.user.role !== "admin") {
    return { error: "Unauthorized" };
  }

  // Prevent deleting self
  if (session.user.id === userId) {
    return { error: "Cannot delete your own account" };
  }

  try {
    // Better Auth handles cascading deletes usually, but we delete from 'user' table directly
    await db.query('DELETE FROM "user" WHERE id = $1', [userId]);
    revalidatePath("/admin/users");
    return { success: true };
  } catch (error: any) {
    console.error("Error deleting user:", error);
    return { error: error.message };
  }
}
