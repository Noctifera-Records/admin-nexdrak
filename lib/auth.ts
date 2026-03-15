import { betterAuth } from "better-auth";
import { admin } from "better-auth/plugins";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { Resend } from "resend";
import { getDb } from "./db";
import { schema } from "./db/schema";
import { resetPasswordTemplate, verifyEmailTemplate } from "./email-templates";

// Initialize Resend lazily inside a helper function to avoid global scope issues
function getResend() {
  const apiKey = process.env.RESEND_API_KEY;
  if (!apiKey) {
    console.warn("WARN: RESEND_API_KEY environment variable is not set.");
    return null;
  }
  return new Resend(apiKey);
}

const getFromEmail = () => process.env.EMAIL_FROM || "admin@nexdrak.com";

// We'll export a getter function to ensure auth is initialized after process.env is populated by OpenNext shim
let _auth: any = null;

export function getAuth() {
  if (_auth) return _auth;

  try {
    const db = getDb();
    const resend = getResend();
    const fromEmail = getFromEmail();
    
    _auth = betterAuth({
      baseURL: process.env.BETTER_AUTH_URL || process.env.NEXT_PUBLIC_BETTER_AUTH_URL,
      secret: process.env.BETTER_AUTH_SECRET, // Ensure secret is passed explicitly
      database: drizzleAdapter(db, {
        provider: "pg",
        schema,
      }),
      emailAndPassword: {
        enabled: true,
        requireEmailVerification: true,
        async sendResetPassword(data, request) {
          if (!resend) return;
          await resend.emails.send({
            from: fromEmail,
            to: data.user.email,
            subject: "Reset your password",
            html: resetPasswordTemplate(data.url),
          });
        },
      },
      emailVerification: {
        async sendVerificationEmail(data, request) {
          if (!resend) return;
          await resend.emails.send({
            from: fromEmail,
            to: data.user.email,
            subject: "Verify your email address",
            html: verifyEmailTemplate(data.url),
          });
        },
      },
      socialProviders: {},
      plugins: [
        admin(),
      ],
    });
    
    return _auth;
  } catch (error) {
    console.error("Better Auth init failed:", error);
    // Return a mock object to prevent breaking the build, 
    // but the handler will return a 503
    return {
      api: { getSession: async () => null },
      handler: async (req: Request) => new Response("Auth unavailable (DB connection error)", { status: 503 }),
    } as any;
  }
}

// Keep the export for backward compatibility but it will be a proxy or we'll update the routes
export const auth = {
  get handler() {
    return getAuth().handler;
  },
  get api() {
    return getAuth().api;
  }
} as any;
