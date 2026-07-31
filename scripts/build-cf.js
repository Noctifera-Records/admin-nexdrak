const { execSync } = require("node:child_process");
const path = require("node:path");

// Same env vars OpenNext sets in setStandaloneBuildMode() when it runs the
// Next.js build itself. We build manually with webpack (Turbopack SSR chunks
// are not compatible with the Cloudflare runtime), so we must set them here.
process.env.NEXT_PRIVATE_STANDALONE = "true";
process.env.NEXT_PRIVATE_OUTPUT_TRACE_ROOT = process.cwd();

const run = (cmd) => execSync(cmd, { stdio: "inherit" });

run("npx next build --webpack");
run("npx opennextjs-cloudflare build --skipBuild");
run("node scripts/fix-statics.js");
