import { betterAuth } from "better-auth";
import { admin } from "better-auth/plugins";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { Resend } from "resend";
import { getDb } from "./db";
import { schema } from "./db/schema";
import { resetPasswordTemplate, verifyEmailTemplate } from "./email-templates";

const resend = new Resend(process.env.RESEND_API_KEY);
const fromEmail = process.env.EMAIL_FROM!;

if (!fromEmail) {
    console.warn("WARN: EMAIL_FROM environment variable is not set. Emails may fail to send.");
}

export const auth = (() => {
  try {
    const db = getDb();
    
    return betterAuth({
      database: drizzleAdapter(db, {
        provider: "pg", // Use 'pg' for postgres dialect
        schema,
      }),
      emailAndPassword: {
        enabled: true,
        requireEmailVerification: true,
        async sendResetPassword(data, request) {
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
        // MFA is optional for admin users: no forced flow while setting from DB (or disable plugin entirely if not needed)
        // twoFactor({ issuer: "NexDrak" }),
      ],
    });
  } catch (error) {
    console.error("Better Auth init failed:", error);
    return {
      api: { getSession: async () => null },
      handler: async () => new Response("Auth unavailable", { status: 503 }),
    } as any;
  }
})();
