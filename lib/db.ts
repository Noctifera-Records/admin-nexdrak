import { Pool, neonConfig } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-serverless';

// Critical for Cloudflare Workers/Pages to maintain stable WebSocket connections
neonConfig.fetchConnectionCache = true;

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

/**
 * Reusable pool instance.
 * In Cloudflare Workers, this might be reset between isolates.
 */
let pool: Pool | null = null;

export function getDb() {
  const connectionString = getConnectionString();
  
  if (!pool) {
    pool = new Pool({ connectionString });
  }
  
  return drizzle(pool);
}

// Legacy compatibility for direct SQL queries
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
      // Must end pool to release worker resource
      await tempPool.end().catch(() => {});
    }
  },
};
