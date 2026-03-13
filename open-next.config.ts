import { defineCloudflareConfig } from "@opennextjs/cloudflare";

const cloudflareConfig = defineCloudflareConfig();

export default {
  ...cloudflareConfig,
  build: {
    minify: true,
    external: [
      "async_hooks", "buffer", "crypto", "events", "fs", "http", "https",
      "os", "path", "stream", "util", "vm", "url", "zlib", "string_decoder",
      "tls", "net",
      "pg", "pg-native", "pg-pool", "pg-protocol", "pg-types",
      "better-sqlite3", "mysql2", "oracledb", "tedious", "sqlite3", "@vscode/sqlite3",
      "kysely",
      "@supabase/auth-helpers-nextjs", "@supabase/auth-ui-react", "@supabase/auth-ui-shared",
      "@vercel/node", "@vercel/remix-builder", "@vercel/og", "esbuild", "swc"
    ],
  },
} as any;
