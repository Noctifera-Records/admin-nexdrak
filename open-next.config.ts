import type { OpenNextConfig } from "@opennextjs/cloudflare";

const config: OpenNextConfig = {
  default: {
    runtime: "edge",
    override: {
      wrapper: "cloudflare-node",
      converter: "edge",
      proxyExternalRequest: "fetch",
    },
  },
  // Esto ayuda a evitar problemas con paquetes que esperan Node.js
  edgeExternals: ["node:crypto", "node:events", "node:util"],
  middleware: {
    external: true,
  },
};

export default config;
