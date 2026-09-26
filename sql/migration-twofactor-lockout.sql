-- Migration: Add account lockout columns to the "twoFactor" table
-- Required by Better Auth's two-factor plugin (v1.6.x) for brute-force protection
-- on TOTP / backup-code verification.
--
-- The table stores its columns with mixed case, so identifiers MUST be quoted.
-- Run this once against your database (e.g. via Supabase SQL editor or psql).

ALTER TABLE public."twoFactor"
    ADD COLUMN IF NOT EXISTS "verified" boolean NOT NULL DEFAULT true,
    ADD COLUMN IF NOT EXISTS "failedVerificationCount" integer NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS "lockedUntil" timestamp with time zone;

-- Existing rows get the defaults above automatically.
-- Optional sanity check:
-- SELECT column_name, data_type FROM information_schema.columns
--   WHERE table_schema = 'public' AND table_name = 'twoFactor' ORDER BY ordinal_position;
