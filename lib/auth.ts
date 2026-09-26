import { betterAuth } from "better-auth";
import { admin, twoFactor } from "better-auth/plugins";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { Resend } from "resend";
import { getDb, withDb, type Db } from "./db";
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
 *
 * IMPORTANT (Cloudflare Workers): every call creates a connection Pool. If the
 * caller already owns a Pool (the `withDb` helper), it MUST be passed in as
 * `db` so the socket is closed before the request ends. Otherwise the leaked
 * WebSocket produces the classic "Cannot perform I/O on behalf of a different
 * request" error on a later request.
 */
export function getAuth(db?: Db) {
  const database = db ?? getDb();

  /**
   * Same guard as the public site: a localhost BETTER_AUTH_URL must never leak
   * into a production build, otherwise Better Auth would mint cookies for the
   * wrong host and sign-in/sign-out would silently fail.
   */
  const rawBaseURL = process.env.BETTER_AUTH_URL || process.env.NEXT_PUBLIC_BETTER_AUTH_URL;
  const baseURL =
    !rawBaseURL || (rawBaseURL.includes("localhost") && process.env.NODE_ENV === "production")
      ? "https://admin.nexdrak.com"
      : rawBaseURL.split(" ")[0].replace(/\/$/, "");

  return betterAuth({
    baseURL,
    secret: process.env.BETTER_AUTH_SECRET,
    /**
     * Origins allowed to call the auth endpoints. The admin panel is reachable
     * both from its own domain and from the public site, and during local
     * development from localhost, so all of them must be listed explicitly.
     * Without this, Better Auth rejects requests whose Origin header does not
     * match the configured baseURL (random failed sign-in / sign-out).
     */
    trustedOrigins: [
      "https://admin.nexdrak.com",
      "https://nexdrak.com",
      "https://www.nexdrak.com",
      "http://localhost:3000",
      "http://localhost:3001",
    ],
    database: drizzleAdapter(database, {
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
 * Exported object for backward compatibility in standard routes and actions.
 *
 * Both accessors run inside `withDb`, so the connection they use is closed as
 * soon as the call finishes. Previously `auth.api` built a fresh, never-closed
 * Pool on every property access, and those leaked WebSockets were the source of
 * the random "Cannot perform I/O on behalf of a different request" failures.
 */
export const auth = {
  get handler() {
    return (req: Request) => withDb((db) => getAuth(db).handler(req));
  },
  api: new Proxy({} as Record<string, (...args: any[]) => any>, {
    get(_target, property) {
      if (typeof property !== "string") return undefined;
      return (...args: any[]) => withDb((db) => (getAuth(db).api as any)[property](...args));
    },
  }),
} as any;
