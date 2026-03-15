import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

/**
 * getDb initializes a new database connection for Drizzle using postgres.js.
 * This is the recommended way for Cloudflare Workers + Supabase/Postgres
 * because it handles the edge environment efficiently.
 */
export function getDb() {
  const connectionString = getConnectionString();
  
  // Initialize postgres.js client
  const queryClient = postgres(connectionString, {
    ssl: 'require',
    prepare: false, // Required for Supabase connection pooling (Transaction mode)
    connect_timeout: 10,
  });
  
  return drizzle(queryClient);
}

// Legacy compatibility for direct SQL queries
export const db = {
  query: async (sqlText: string, params?: unknown[]) => {
    const connectionString = getConnectionString();
    const sql = postgres(connectionString, { ssl: 'require', prepare: false });
    try {
      const result = await sql.unsafe(sqlText, params || []);
      return { rows: result };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    } finally {
      // Close connection
      await sql.end();
    }
  },
};
