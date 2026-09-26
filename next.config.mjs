/** @type {import('next').NextConfig} */
const nextConfig = {
  transpilePackages: ['lucide-react'],
  typescript: {
    ignoreBuildErrors: true,
  },
  experimental: {
    // The song form can submit a cover image as a base64 data URL
    // (components/image-upload.tsx accepts images up to 5 MB, which is roughly
    // 6.7 MB once base64 encoded). The default 1 MB Server Action body limit
    // rejected those saves with an opaque error.
    serverActions: {
      bodySizeLimit: '8mb',
    },
  },
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'i.ibb.co',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'jrspddhtfdfbnxklvbgx.supabase.co',
        port: '',
        pathname: '/**',
      }
    ],
  },
};

export default nextConfig;
