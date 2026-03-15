import { neon, neonConfig } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';

// Force neon to use only fetch (HTTP) and disable websocket attempts for Supabase compatibility on Cloudflare.
// This is critical when using Supabase Transaction Pooler (6543)
if (typeof window === 'undefined') {
  neonConfig.fetchConnectionCache = true;
}

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    // In Cloudflare, environment variables are attached to the 'env' object
    // but OpenNext shims process.env. If it's still missing, we log it.
    console.error('DATABASE_URL is missing in process.env');
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

export function getDb() {
  try {
    const connectionString = getConnectionString();
    const sql = neon(connectionString);
    return drizzle(sql);
  } catch (error) {
    console.error('Failed to initialize database connection:', error);
    throw error;
  }
}

// Legacy compatibility for existing code
type DbQueryResult<Row = any> = { rows: Row[] };
type DbLike = { query: (sql: string, params?: unknown[]) => Promise<DbQueryResult> };

export const db: DbLike = {
  query: async (sqlText: string, params?: unknown[]) => {
    try {
      const connectionString = getConnectionString();
      const sql = neon(connectionString, { fullResults: true });
      const result = await sql.query(sqlText, params || []);
      return { rows: (result.rows as any[]) || [] };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    }
  },
};
