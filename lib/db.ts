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
 * In Cloudflare Workers, we create a new pool/client per request context.
 */
export function getDb() {
  const connectionString = getConnectionString();
  const pool = new Pool({ connectionString });
  
  // Extend the drizzle object with a direct query method for legacy support
  const drizzleDb = drizzle(pool);
  
  return Object.assign(drizzleDb, {
    async query(sqlText: string, params?: unknown[]) {
      try {
        const result = await pool.query(sqlText, params || []);
        return { rows: result.rows };
      } catch (error) {
        console.error('Database query error:', error);
        throw error;
      } finally {
        // En consultas individuales cerramos el pool inmediatamente
        await pool.end().catch(() => {});
      }
    },
    async end() {
      await pool.end().catch(() => {});
    }
  });
}

/**
 * Legacy compatibility object.
 * Warning: This creates a new pool for every single call.
 * For multiple queries, prefer using withDb.
 */
export const db = {
  async query(sqlText: string, params?: unknown[]) {
    const connectionString = getConnectionString();
    const pool = new Pool({ connectionString });
    try {
      const result = await pool.query(sqlText, params || []);
      return { rows: result.rows };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    } finally {
      await pool.end().catch(() => {});
    }
  }
} as any;

/**
 * Executes a callback within a single database connection.
 * Useful for transactions or multiple related queries.
 */
export async function withDb<T>(callback: (db: ReturnType<typeof getDb>) => Promise<T>): Promise<T> {
  const dbInstance = getDb();
  try {
    return await callback(dbInstance);
  } finally {
    // getDb().query already handles its own end(), but drizzle calls might not
    await dbInstance.end();
  }
}
