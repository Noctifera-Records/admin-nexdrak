import Link from "next/link";

export default function HomePage() {
  return (
    <main className="min-h-screen flex items-center justify-center p-8">
      <div className="max-w-xl text-center">
        <h1 className="text-3xl font-bold mb-4">🍍 Panel</h1>
        <p className="mb-4">Welcome to the 🍍Panel.</p>
        {/* <p className="mb-6">Sign in to interact with the site.</p> */}
        <Link href="/admin" className="rounded-lg px-4 py-2 bg-slate-800 text-white">Go to Panel</Link>
      </div>
    </main>
  );
}
