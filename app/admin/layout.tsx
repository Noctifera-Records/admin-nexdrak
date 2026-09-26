import { redirect } from "next/navigation";
import { getSessionFromDb } from "@/lib/auth-guard";
import AdminShell from "@/components/admin/admin-shell";

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
    // `getSessionFromDb` closes its connection pool before returning, so the
    // re-render triggered by a Server Action cannot fail with a leaked
    // cross-request socket ("An error occurred in the Server Components render").
    const session = await getSessionFromDb();

    if (!session) {
        redirect("/login");
    }

    const user = session.user as any;

    if (user.role !== "admin") {
        redirect("/");
    }

    return <AdminShell user={session.user}>{children}</AdminShell>;
}
