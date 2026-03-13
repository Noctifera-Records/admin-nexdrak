import Link from "next/link";

export default function HomePage() {
  return (
    <main className="min-h-screen flex items-center justify-center p-8">
      <div className="max-w-xl text-center">
        <h1 className="text-3xl font-bold mb-4">NexDrak Admin</h1>
        <p className="mb-4">Bienvenido al panel de administración standalone.</p>
        <p className="mb-6">Usa el menú lateral para administrar canciones, eventos, merch, descargas y usuarios.</p>
        <Link href="/admin" className="rounded-lg px-4 py-2 bg-slate-800 text-white">Ir a Admin</Link>
      </div>
    </main>
  );
}
