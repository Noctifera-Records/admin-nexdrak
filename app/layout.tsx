import type { Metadata, Viewport } from "next";
import "./globals.css";
import { ThemeProvider } from "@/components/theme-provider";
import { ThemeToggle } from "@/components/theme-toggle";

export const metadata: Metadata = {
  title: "NexDrak Admin",
  description: "Dashboard de administración de NexDrak",
  robots: "noindex, nofollow",
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className="scroll-smooth" suppressHydrationWarning>
      <body className="min-h-screen bg-background text-foreground transition-colors duration-300">
        <ThemeProvider attribute="class" defaultTheme="dark" enableSystem={false} disableTransitionOnChange>
          <div className="min-h-screen flex flex-col">
            <header className="w-full border-b border-border px-4 py-3 bg-card/90 backdrop-blur-md flex items-center justify-between">
              <span className="text-lg font-bold">NexDrak Admin</span>
              <ThemeToggle />
            </header>
            <main className="flex-1 p-4 max-w-6xl mx-auto w-full">{children}</main>
          </div>
        </ThemeProvider>
      </body>
    </html>
  );
}
