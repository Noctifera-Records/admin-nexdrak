import { Client } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-serverless';

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

/**
 * getDb initializes a new database connection for Drizzle.
 * In a serverless environment like Cloudflare Workers, 
 * we create a new client to ensure connections are correctly managed.
 */
export function getDb() {
  const connectionString = getConnectionString();
  const client = new Client(connectionString);
  return drizzle(client);
}

// Legacy compatibility for direct SQL queries
export const db = {
  query: async (sqlText: string, params?: unknown[]) => {
    const connectionString = getConnectionString();
    const client = new Client(connectionString);
    try {
      await client.connect();
      const result = await client.query(sqlText, params || []);
      return { rows: result.rows };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    } finally {
      // Very important: closing the connection prevents the worker from hanging
      try {
        await client.end();
      } catch (e) {
        // Ignore end errors
      }
    }
  },
};
