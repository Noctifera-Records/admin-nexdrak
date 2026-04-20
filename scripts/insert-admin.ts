import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as schema from '../lib/db/schema';
import 'dotenv/config';

async function main() {
  const connectionString = process.env.DATABASE_URL!;
  const queryClient = postgres(connectionString);
  const db = drizzle(queryClient, { schema });

  try {
    await db.insert(schema.user).values({
      id: 'admin-manual-12345',
      name: 'Admin',
      email: 'tnexdrak@gmail.com',
      emailVerified: true,
      role: 'admin',
    });
    console.log('User created successfully');
  } catch (e) {
    console.error('Error creating user:', e);
  } finally {
    await queryClient.end();
  }
}

main();
