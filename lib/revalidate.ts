import { revalidatePath } from "next/cache";

/**
 * Wraps revalidatePath in a try-catch.
 * In Cloudflare Workers, revalidatePath can be unstable and crash the whole
 * Server Action on minor cache failures, so failures here are non-critical.
 */
export function safeRevalidate(path: string) {
  try {
    revalidatePath(path);
  } catch (error) {
    console.warn(`[safeRevalidate] revalidatePath("${path}") failed (non-critical):`, error);
  }
}
