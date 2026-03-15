import { neon } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';

/**
 * Usamos neon-http que es el driver más ligero y compatible con Cloudflare Pages.
 * Para que funcione con Supabase, es vital usar la URL de conexión correcta.
 */
function getConnectionString() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

export function getDb() {
  // neon-http usa fetch() nativo de Cloudflare, evitando errores de módulos "pg" o "ws"
  const sql = neon(getConnectionString());
  return drizzle(sql);
}

// Legacy compatibility
export const db = {
  query: async (sqlText: string, params?: unknown[]) => {
    try {
      const sql = neon(getConnectionString(), { fullResults: true });
      const result = await sql.query(sqlText, params || []);
      return { rows: result.rows };
    } catch (error) {
      console.error('Database query error:', error);
      throw error;
    }
  },
};
