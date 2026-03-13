import { redirect } from 'next/navigation';

export default function RegisterPage() {
  // Public registration is disabled for the admin panel.
  // Admins must be created by other admins via the dashboard.
  redirect('/login?message=Registration is restricted to existing administrators.');
}
