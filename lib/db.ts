import { Pool } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-serverless';

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

/**
 * getDb initializes a database connection.
 * IMPORTANT: We use rawQuery to avoid colliding with Drizzle's Relational API (db.query).
 */
export function getDb() {
  const connectionString = getConnectionString();
  const pool = new Pool({ connectionString });
  
  const drizzleDb = drizzle(pool);
  
  return Object.assign(drizzleDb, {
    async rawQuery(sqlText: string, params?: unknown[]) {
      try {
        const result = await pool.query(sqlText, params || []);
        return { rows: result.rows };
      } catch (error) {
        console.error('Database rawQuery error:', error);
        throw error;
      }
    },
    async end() {
      await pool.end().catch(() => {});
    }
  });
}

/**
 * Legacy compatibility object.
 */
export const db = {
  async query(sqlText: string, params?: unknown[]) {
    const dbInstance = getDb();
    try {
      return await dbInstance.rawQuery(sqlText, params);
    } finally {
      await dbInstance.end();
    }
  }
} as any;

/**
 * Executes a callback within a single database connection.
 */
export async function withDb<T>(callback: (db: ReturnType<typeof getDb>) => Promise<T>): Promise<T> {
  const dbInstance = getDb();
  try {
    return await callback(dbInstance);
  } finally {
    await dbInstance.end();
  }
}
