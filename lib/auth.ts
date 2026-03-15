import { betterAuth } from "better-auth";
import { admin } from "better-auth/plugins";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { Resend } from "resend";
import { getDb } from "./db";
import { schema } from "./db/schema";
import { resetPasswordTemplate, verifyEmailTemplate } from "./email-templates";

function getResend() {
  const apiKey = process.env.RESEND_API_KEY;
  if (!apiKey) return null;
  return new Resend(apiKey);
}

const getFromEmail = () => process.env.EMAIL_FROM || "noreply@nexdrak.com";

let _auth: any = null;

export function getAuth() {
  if (_auth) return _auth;

  console.log("[Auth] Initializing Better Auth...");
  console.log("[Auth] DATABASE_URL exists:", !!process.env.DATABASE_URL);
  console.log("[Auth] BETTER_AUTH_URL:", process.env.BETTER_AUTH_URL || process.env.NEXT_PUBLIC_BETTER_AUTH_URL);

  try {
    const db = getDb();
    
    _auth = betterAuth({
      baseURL: process.env.BETTER_AUTH_URL || process.env.NEXT_PUBLIC_BETTER_AUTH_URL,
      secret: process.env.BETTER_AUTH_SECRET,
      database: drizzleAdapter(db, {
        provider: "pg",
        schema,
      }),
      // Desactivamos rate limit temporalmente para debug
      rateLimit: {
        enabled: false,
      },
      emailAndPassword: {
        enabled: true,
        requireEmailVerification: false, // Temporalmente false para evitar fallos de Resend
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
      socialProviders: {},
      plugins: [
        admin(),
      ],
    });
    
    return _auth;
  } catch (error: any) {
    console.error("[Auth] Fatal init error:", error.message);
    return {
      api: { getSession: async () => null },
      handler: async (req: Request) => new Response(JSON.stringify({ 
        error: "Auth initialization failed",
        details: error.message 
      }), { status: 503, headers: { "Content-Type": "application/json" } }),
    } as any;
  }
}

export const auth = {
  get handler() {
    return (req: Request) => getAuth().handler(req);
  },
  get api() {
    return getAuth().api;
  }
} as any;
