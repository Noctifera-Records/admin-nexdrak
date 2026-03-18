import { betterAuth } from "better-auth";
import { admin, twoFactor } from "better-auth/plugins";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { Resend } from "resend";
import { getDb } from "./db";
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
 * We use getDb() which creates a Pool. 
 * Better Auth manages its own internal queries through the adapter.
 */
export function getAuth() {
  const db = getDb();
  
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
