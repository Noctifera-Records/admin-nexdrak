import { Client, neonConfig } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-serverless';
import ws from 'ws';

// Required for compatibility with Supabase/Postgres over WebSockets in some environments
if (typeof window === 'undefined') {
  neonConfig.webSocketConstructor = ws;
}

function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

export function getDb() {
  const client = new Client(getConnectionString());
  // neon-serverless connection
  return drizzle(client);
}

// Legacy compatibility
export const db = {
  query: async (sqlText: string, params?: unknown[]) => {
    const client = new Client(getConnectionString());
    try {
      await client.connect();
      const result = await client.query(sqlText, params || []);
      return { rows: result.rows };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    } finally {
      await client.end();
    }
  },
};
