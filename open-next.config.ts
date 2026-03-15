import type { OpenNextConfig } from "@opennextjs/cloudflare";

const config: OpenNextConfig = {
  default: {
    override: {
      wrapper: "cloudflare-node",
      converter: "edge",
      proxyExternalRequest: "fetch",
      incrementalCache: "dummy",
      tagCache: "dummy",
      queue: "dummy",
    },
  },
  // We include essential node built-ins for better-auth and drizzle
  // Note: we don't include node:net or node:tls if we are using neon-serverless (WebSocket)
  // as it avoids "Module not found" if Cloudflare doesn't support them in the requested compatibility date.
  edgeExternals: ["node:crypto", "node:util", "node:events", "node:buffer"],
  middleware: {
    external: true,
    override: {
      wrapper: "cloudflare-edge",
      converter: "edge",
      proxyExternalRequest: "fetch",
      incrementalCache: "dummy",
      tagCache: "dummy",
      queue: "dummy",
    },
  },
};

export default config;
