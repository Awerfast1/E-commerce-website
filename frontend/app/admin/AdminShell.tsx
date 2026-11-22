"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState, type ReactNode } from "react";

import { logoutAction } from "./actions";
import AdminIcon from "./AdminIcon";

export type NavItem = { href: string; label: string; icon: string };
export type NavGroup = { label: string; items: NavItem[] };

export default function AdminShell({
  user,
  nav,
  children,
}: {
  user: { displayName: string; email: string };
  nav: NavGroup[];
  children: ReactNode;
}) {
  const pathname = usePathname();
  const [open, setOpen] = useState(false);

  const allItems = nav.flatMap((group) => group.items);
  const current =
    allItems.find((item) => pathname === item.href) ||
    allItems
      .filter((item) => pathname?.startsWith(`${item.href}/`))
      .sort((a, b) => b.href.length - a.href.length)[0];

  const isActive = (href: string) =>
    pathname === href || (href !== "/admin" && pathname?.startsWith(`${href}/`));

  return (
    <div className="min-h-screen bg-slate-100 text-slate-900 lg:flex">
      {open && (
        <button
          type="button"
          aria-label="Đóng menu"
          className="fixed inset-0 z-30 bg-slate-950/50 lg:hidden"
          onClick={() => setOpen(false)}
        />
      )}

      <aside
        className={`fixed inset-y-0 left-0 z-40 flex w-72 flex-col bg-slate-950 text-slate-300 transition-transform duration-200 lg:static lg:translate-x-0 ${
          open ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        <div className="flex items-center justify-between border-b border-white/10 px-5 py-5">
          <Link href="/admin" className="flex items-center gap-3" onClick={() => setOpen(false)}>
            <span className="grid h-10 w-10 place-items-center rounded-xl bg-emerald-500 text-lg font-black text-slate-950">
              C
            </span>
            <span>
              <span className="block text-sm font-bold tracking-[0.2em] text-white">CONGEARS</span>
              <span className="block text-[11px] font-medium uppercase tracking-widest text-emerald-400">
                Admin console
              </span>
            </span>
          </Link>
          <button
            type="button"
            className="rounded-lg p-2 text-slate-400 hover:bg-white/10 hover:text-white lg:hidden"
            onClick={() => setOpen(false)}
            aria-label="Đóng menu"
          >
            <AdminIcon name="close" />
          </button>
        </div>

        <nav className="flex-1 space-y-6 overflow-y-auto px-3 py-5">
          <Link
            href="/admin"
            onClick={() => setOpen(false)}
            className={`flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm font-medium transition ${
              pathname === "/admin"
                ? "bg-emerald-500/15 text-emerald-300 ring-1 ring-inset ring-emerald-500/30"
                : "text-slate-400 hover:bg-white/5 hover:text-white"
            }`}
          >
            <AdminIcon name="dashboard" />
            Tổng quan
          </Link>

          {nav.map((group) => (
            <div key={group.label}>
              <p className="mb-2 px-3 text-[10px] font-bold uppercase tracking-[0.18em] text-slate-500">
                {group.label}
              </p>
              <div className="space-y-1">
                {group.items.map((item) => (
                  <Link
                    key={item.href}
                    href={item.href}
                    onClick={() => setOpen(false)}
                    className={`flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm transition ${
                      isActive(item.href)
                        ? "bg-white/10 font-semibold text-white"
                        : "text-slate-400 hover:bg-white/5 hover:text-white"
                    }`}
                  >
                    <AdminIcon name={item.icon} className="h-[18px] w-[18px]" />
                    {item.label}
                  </Link>
                ))}
              </div>
            </div>
          ))}
        </nav>

        <div className="border-t border-white/10 p-3">
          <Link
            href="/"
            className="flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm text-slate-400 transition hover:bg-white/5 hover:text-white"
          >
            <AdminIcon name="external" className="h-[18px] w-[18px]" />
            Xem cửa hàng
          </Link>
        </div>
      </aside>

      <div className="flex min-w-0 flex-1 flex-col">
        <header className="sticky top-0 z-20 flex items-center gap-3 border-b border-slate-200 bg-white/90 px-4 py-3 backdrop-blur lg:px-8">
          <button
            type="button"
            className="rounded-lg border border-slate-200 p-2 text-slate-600 lg:hidden"
            onClick={() => setOpen(true)}
            aria-label="Mở menu"
          >
            <AdminIcon name="menu" />
          </button>

          <div className="min-w-0 flex-1">
            <p className="truncate text-sm font-semibold text-slate-900">{current?.label || "Tổng quan"}</p>
            <p className="truncate text-xs text-slate-500">Bảng điều khiển quản trị ConGears</p>
          </div>

          <div className="hidden items-center gap-3 sm:flex">
            <div className="text-right">
              <p className="text-sm font-semibold leading-tight text-slate-900">{user.displayName}</p>
              <p className="text-xs text-slate-500">{user.email}</p>
            </div>
            <span className="grid h-10 w-10 place-items-center rounded-full bg-slate-900 text-sm font-bold text-white">
              {user.displayName.slice(0, 1).toUpperCase()}
            </span>
          </div>

          <form action={logoutAction}>
            <button
              type="submit"
              className="flex items-center gap-2 rounded-lg border border-slate-200 px-3 py-2 text-xs font-semibold text-slate-600 transition hover:border-rose-200 hover:bg-rose-50 hover:text-rose-600"
            >
              <AdminIcon name="logout" className="h-4 w-4" />
              <span className="hidden sm:inline">Đăng xuất</span>
            </button>
          </form>
        </header>

        <main className="flex-1 px-4 py-6 lg:px-8 lg:py-8">{children}</main>
      </div>
    </div>
  );
}
