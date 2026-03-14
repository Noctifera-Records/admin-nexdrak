/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  // Desactivamos Turbopack explícitamente si estuviera activo por alguna razón
  transpilePackages: ['lucide-react'],
  typescript: {
    ignoreBuildErrors: true,
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
};

export default nextConfig;
