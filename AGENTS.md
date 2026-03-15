# NexDrak Admin App (Standalone) - AGENTS Documentation

## 1. Purpose
This repository is the **admin panel** for NexDrak and is designed as a **separate deploy target** from the public website (`nexdrak.com`). It is built to keep the Cloudflare Pages free tier `< 3 MiB worker` constraint by splitting admin-heavy server code into a separate app.

## 2. Stack
- Next.js 16.x (App Router)
- React 19
- TypeScript Strict
- Tailwind CSS + shadcn UI
- Better Auth 1.5.x (email/password + admin plugin)
- Drizzle ORM with Neon HTTP adapter
- Supabase (used for some operations, but mainly Drizzle/Neon for Admin CRUD)
- `next-themes` (light/dark mode)
- Cloudflare Pages (OpenNext adapter)

## 3. Entry points
- `/` = admin landing page
- `/login`, `/forgot-password`, `/reset-password` (self-managed)
- `/register` = **DISABLED**. Now redirects to `/login`. New admins must be created by an existing admin.
- `/admin/*` dashboard routes (protected by server-side role checks)
- `/api/auth/[...all]` implements Better Auth request handler

## 4. Auth & Database Setup
### Schema Consistency
- **Table names and columns:** Must match `sql/backup.sql` exactly.
- **`twoFactor` table:** Uses camelCase naming in DB (`twoFactor`, `backupCodes`, `userId`). The Drizzle schema in `lib/db/auth.schema.ts` is configured to match these quoted identifiers.
- **Songs:** The `track_number` field is **NOT** present in the current DB schema and has been removed from the UI and server actions to avoid errors.

### `lib/auth.ts`
- Exposes Better Auth instance with `admin()` plugin.
- Social providers are disabled for the admin panel.

## 5. Privacy & SEO
- **No Indexing:** The site is strictly private.
  - `app/robots.ts`: Configured to `disallow: /` for all user agents.
  - `app/layout.tsx`: Includes `noindex, nofollow` metadata.

## 6. Deployment to Cloudflare Pages
### required config files
- `open-next.config.ts` (externalize node internals + pgDrivers)
- `wrangler.toml` configured for Pages output
- `package.json` includes:
  - `build:cf` -> `opennextjs-cloudflare build && node scripts/fix-statics.js`
  - `deploy:cf` -> `npx wrangler pages deploy .open-next --project-name nexdrak-admin`

### env variables
- `DATABASE_URL` (Neon/Postgres)
- `BETTER_AUTH_URL`, `BETTER_AUTH_SECRET`
- `RESEND_API_KEY`, `EMAIL_FROM`
- `NEXT_PUBLIC_BETTER_AUTH_URL` (for client)
- `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## 7. Development Guidelines
- **Registration:** Do not re-enable public registration. New admin accounts must be created through the "Manage Admins" section in the dashboard.
- **Schema changes:** Always verify against `sql/backup.sql` before adding new fields or changing column types/cases.
- **Validation:** Use Zod for server action input validation.
