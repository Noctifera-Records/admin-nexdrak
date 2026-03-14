import type { OpenNextConfig } from "@opennextjs/cloudflare";

const config: OpenNextConfig = {
  default: {
    override: {
      wrapper: "cloudflare-node",
      converter: "node",
      proxyExternalRequest: "fetch",
      incrementalCache: "dummy",
      tagCache: "dummy",
      queue: "dummy",
    },
  },
  // Inclusión forzada de librerías para Better Auth y Drizzle
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
  // Asegurar que los assets estáticos se sirvan correctamente
  dangerous: {
    enableCacheInterception: false,
  },
};

export default config;
