import Link from "next/link";
import { redirect } from "next/navigation";

import { getAdminSession } from "@/lib/admin/auth";
import AdminIcon from "../AdminIcon";
import LoginForm from "./LoginForm";

export const instant = false;

export const metadata = {
  title: "Đăng nhập quản trị | ConGears",
};

export default async function AdminLoginPage() {
  const session = await getAdminSession();
  if (session) redirect("/admin");

  return (
    <main className="relative flex min-h-screen items-center justify-center overflow-hidden bg-slate-950 px-4 py-12">
      <div className="pointer-events-none absolute -left-32 top-0 h-96 w-96 rounded-full bg-emerald-500/20 blur-3xl" />
      <div className="pointer-events-none absolute -right-24 bottom-0 h-96 w-96 rounded-full bg-blue-500/20 blur-3xl" />

      <div className="relative w-full max-w-md">
        <div className="mb-8 flex items-center justify-center gap-3">
          <span className="grid h-12 w-12 place-items-center rounded-2xl bg-emerald-500 text-xl font-black text-slate-950">
            C
          </span>
          <div>
            <p className="text-lg font-bold tracking-[0.2em] text-white">CONGEARS</p>
            <p className="text-[11px] font-semibold uppercase tracking-[0.25em] text-emerald-400">
              Admin console
            </p>
          </div>
        </div>

        <div className="rounded-3xl border border-white/10 bg-white p-7 shadow-2xl shadow-black/40 sm:p-9">
          <div className="mb-6">
            <h1 className="text-2xl font-bold text-slate-900">Đăng nhập quản trị</h1>
            <p className="mt-1.5 text-sm text-slate-500">
              Sử dụng tài khoản Supabase Auth đã được cấp quyền ADMIN.
            </p>
          </div>

          <LoginForm />

          <div className="mt-6 rounded-2xl bg-slate-50 p-4 text-xs leading-relaxed text-slate-500">
            <p className="flex items-start gap-2">
              <AdminIcon name="shield" className="mt-0.5 h-4 w-4 shrink-0 text-slate-400" />
              <span>
                Chưa vào được? Thêm email của bạn vào biến môi trường{" "}
                <code className="rounded bg-white px-1 py-0.5 text-[11px] text-slate-700">ADMIN_EMAILS</code>{" "}
                hoặc đặt <code className="rounded bg-white px-1 py-0.5 text-[11px] text-slate-700">profiles.account_type</code>{" "}
                thành <strong>ADMIN</strong>.
              </span>
            </p>
          </div>
        </div>

        <p className="mt-6 text-center text-xs text-slate-500">
          <Link href="/" className="hover:text-slate-300">
            ← Về trang bán hàng
          </Link>
        </p>
      </div>
    </main>
  );
}
