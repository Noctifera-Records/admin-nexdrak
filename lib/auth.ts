import { betterAuth } from "better-auth";
import { admin, twoFactor } from "better-auth/plugins";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { Resend } from "resend";
import { neon } from "@neondatabase/serverless";
import { drizzle } from "drizzle-orm/neon-http";
import { schema } from "./db/schema";
import { resetPasswordTemplate, verifyEmailTemplate } from "./email-templates";

// Initialize Resend lazily to ensure env vars are available
function getResend() {
  const apiKey = process.env.RESEND_API_KEY;
  if (!apiKey) return null;
  return new Resend(apiKey);
}

const getFromEmail = () => process.env.EMAIL_FROM || "noreply@nexdrak.com";

/**
 * Initialization of Better Auth.
 * FOR CLOUDFLARE WORKERS: We use neon-http (stateless) for auth 
 * to avoid connection leaks and "Cross-Request I/O" errors.
 */
export function getAuth() {
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  
  // Use HTTP instead of WebSockets/Pool for Auth
  const sql = neon(connectionString);
  const db = drizzle(sql);
  
  return betterAuth({
    baseURL: process.env.BETTER_AUTH_URL || process.env.NEXT_PUBLIC_BETTER_AUTH_URL,
    secret: process.env.BETTER_AUTH_SECRET,
    database: drizzleAdapter(db, {
      provider: "pg", 
      schema,
    }),
    emailAndPassword: {
      enabled: true,
      requireEmailVerification: true,
      async sendResetPassword(data) {
        const resend = getResend();
        if (!resend) return;
        await resend.emails.send({
          from: getFromEmail(),
          to: data.user.email,
          subject: "Reset your password",
          html: resetPasswordTemplate(data.url),
        });
      },
    },
    emailVerification: {
      async sendVerificationEmail(data) {
        const resend = getResend();
        if (!resend) return;
        await resend.emails.send({
          from: getFromEmail(),
          to: data.user.email,
          subject: "Verify your email address",
          html: verifyEmailTemplate(data.url),
        });
      },
    },
    socialProviders: {},
    plugins: [
      admin(),
      twoFactor({
        issuer: "NexDrak",
      })
    ],
  });
}

/**
 * Exported object for backward compatibility in standard routes.
 */
export const auth = {
  get handler() {
    return (req: Request) => getAuth().handler(req);
  },
  get api() {
    return getAuth().api;
  }
} as any;
