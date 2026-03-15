import { Pool, neonConfig } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-serverless';

// Critical for Cloudflare Workers/Pages
neonConfig.fetchConnectionCache = true;

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

/**
 * getDb initializes a database connection.
 * In Cloudflare Workers, we avoid using a global pool variable to prevent
 * "Cannot perform I/O on behalf of a different request" errors.
 */
export function getDb() {
  const connectionString = getConnectionString();
  
  // Create a new pool/client per request context.
  // Cloudflare and Neon handle the underlying TCP/WebSocket efficiently.
  const pool = new Pool({ connectionString });
  
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
      // Must end pool to release worker resource immediately
      await tempPool.end().catch(() => {});
    }
  },
};
