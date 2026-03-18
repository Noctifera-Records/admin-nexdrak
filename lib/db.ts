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
  // while ensuring it uses the same pool instance for the duration of the request
  const db = drizzle(pool);
  
  return Object.assign(db, {
    async query(sqlText: string, params?: unknown[]) {
      try {
        const result = await pool.query(sqlText, params || []);
        return { rows: result.rows };
      } catch (error) {
        console.error('Database query error:', error);
        throw error;
      } finally {
        // Important: In Cloudflare Workers, we don't necessarily want to end 
        // the pool here if the request is still active, but since this is 
        // a per-request pool, we should ensure it's handled.
        // The withConnection method below is safer for multiple queries.
      }
    },
    async end() {
      await pool.end().catch(() => {});
    }
  });
}

/**
 * Executes a callback within a single database connection.
 * Useful for transactions or multiple related queries.
 */
export async function withDb<T>(callback: (db: ReturnType<typeof getDb>) => Promise<T>): Promise<T> {
  const db = getDb();
  try {
    return await callback(db);
  } finally {
    await db.end();
  }
}
