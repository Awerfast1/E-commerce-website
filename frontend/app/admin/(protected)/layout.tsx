import type { ReactNode } from "react";
import { connection } from "next/server";

import AdminShell, { type NavGroup } from "../AdminShell";
import { requireAdmin } from "@/lib/admin/auth";
import { GROUPS, TABLES, tableHref } from "@/lib/admin/config";

export const instant = false;

export const metadata = {
  title: "Admin | ConGears",
};

export default async function AdminProtectedLayout({ children }: { children: ReactNode }) {
  // Admin pages read cookies and the current time, so they must render per request
  // instead of being prerendered (cacheComponents is enabled in next.config.ts).
  await connection();

  const { user } = await requireAdmin();

  const nav: NavGroup[] = GROUPS.map((group) => ({
    label: group.label,
    items: TABLES.filter((table) => table.group === group.key).map((table) => ({
      href: tableHref(table.key),
      label: table.label,
      icon: table.icon,
    })),
  }));

  return (
    <AdminShell user={{ displayName: user.displayName, email: user.email }} nav={nav}>
      {children}
    </AdminShell>
  );
}
