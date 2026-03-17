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
  return drizzle(pool);
}

/**
 * Legacy compatibility object for direct SQL queries.
 * Warning: Standard db.query creates a new connection each time.
 * For transactions, use the new transaction method.
 */
export const db = {
  query: async (sqlText: string, params?: unknown[]) => {
    const connectionString = getConnectionString();
    const tempPool = new Pool({ connectionString });
    try {
      const result = await tempPool.query(sqlText, params || []);
      return { rows: result.rows };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    } finally {
      await tempPool.end().catch(() => {});
    }
  },
  
  /**
   * Executes a callback within a single database connection.
   * Useful for transactions or multiple related queries.
   */
  withConnection: async <T>(callback: (client: Pool) => Promise<T>): Promise<T> => {
    const connectionString = getConnectionString();
    const pool = new Pool({ connectionString });
    try {
      return await callback(pool);
    } finally {
      await pool.end().catch(() => {});
    }
  }
};
