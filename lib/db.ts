import { drizzle } from 'drizzle-orm/node-postgres';
import pg from 'pg';

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

/**
 * getDb initializes a new database connection for Drizzle using node-postgres.
 * This is the most stable way for Cloudflare + Supabase when nodejs_compat is enabled.
 */
export function getDb() {
  const connectionString = getConnectionString();
  const pool = new pg.Pool({
    connectionString,
    max: 1,
    ssl: {
      rejectUnauthorized: false,
    },
  });
  return drizzle(pool);
}

// Legacy compatibility for direct SQL queries
export const db = {
  query: async (sqlText: string, params?: unknown[]) => {
    const connectionString = getConnectionString();
    const pool = new pg.Pool({
      connectionString,
      max: 1,
      ssl: {
        rejectUnauthorized: false,
      },
    });
    try {
      const result = await pool.query(sqlText, params || []);
      return { rows: result.rows };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    } finally {
      // Must end pool to release worker resource
      await pool.end();
    }
  },
};
