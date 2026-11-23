import "server-only";

import { createClient } from "@supabase/supabase-js";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";

import { getAdminDb } from "./supabaseAdmin";

export const ADMIN_COOKIE = "cg_admin_session";

export type AdminSession = {
  access_token: string;
  refresh_token: string;
  expires_at: number;
  email: string;
};

export type AdminUser = {
  id: string;
  email: string;
  displayName: string;
};

function authUrl(path: string) {
  const base = process.env.NEXT_PUBLIC_SUPABASE_URL;
  if (!base) throw new Error("Missing NEXT_PUBLIC_SUPABASE_URL");
  return `${base.replace(/\/$/, "")}${path}`;
}

function publishableKey() {
  const key =
    process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ||
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!key) throw new Error("Missing public Supabase key (NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY / NEXT_PUBLIC_SUPABASE_ANON_KEY)");
  return key;
}

export function createAuthClient() {
  return createClient(process.env.NEXT_PUBLIC_SUPABASE_URL || "", publishableKey(), {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
      detectSessionInUrl: false,
    },
  });
}

export function encodeSession(session: AdminSession) {
  return Buffer.from(JSON.stringify(session), "utf8").toString("base64url");
}

export function decodeSession(value: string): AdminSession | null {
  try {
    const parsed = JSON.parse(Buffer.from(value, "base64url").toString("utf8")) as AdminSession;
    if (!parsed?.access_token || !parsed?.email) return null;
    return parsed;
  } catch {
    return null;
  }
}

export async function readSessionCookie(): Promise<AdminSession | null> {
  const store = await cookies();
  const raw = store.get(ADMIN_COOKIE)?.value;
  if (!raw) return null;
  return decodeSession(raw);
}

export async function writeSessionCookie(session: AdminSession) {
  const store = await cookies();
  store.set(ADMIN_COOKIE, encodeSession(session), {
    httpOnly: true,
    sameSite: "lax",
    secure: process.env.NODE_ENV === "production",
    path: "/",
    maxAge: 60 * 60 * 8,
  });
}

export async function clearSessionCookie() {
  const store = await cookies();
  store.delete(ADMIN_COOKIE);
}

type SupabaseUser = {
  id: string;
  email?: string;
  app_metadata?: Record<string, unknown>;
};

async function fetchSupabaseUser(accessToken: string): Promise<SupabaseUser | null> {
  const response = await fetch(authUrl("/auth/v1/user"), {
    headers: {
      apikey: publishableKey(),
      Authorization: `Bearer ${accessToken}`,
    },
    cache: "no-store",
  });

  if (response.status === 401 || response.status === 403) return null;
  if (!response.ok) throw new Error(`Supabase Auth user check failed (${response.status})`);
  return (await response.json()) as SupabaseUser;
}

export async function isAdminAccount(userId: string, email: string, appMetadata?: Record<string, unknown>) {
  const allowlist = (process.env.ADMIN_EMAILS || "")
    .split(",")
    .map((item) => item.trim().toLowerCase())
    .filter(Boolean);

  if (email && allowlist.includes(email.toLowerCase())) return true;

  const role = String(appMetadata?.role ?? appMetadata?.account_type ?? "").toUpperCase();
  if (role === "ADMIN") return true;

  const { data } = await getAdminDb()
    .from("profiles")
    .select("account_type, account_status, display_name")
    .eq("user_id", userId)
    .maybeSingle();

  if (!data) return false;
  const type = String(data.account_type ?? "").toUpperCase();
  const status = String(data.account_status ?? "").toUpperCase();
  return type === "ADMIN" && status === "ACTIVE";
}

/**
 * Returns the signed-in admin or null. The Supabase access token is validated
 * against Supabase Auth before any service-role query is made.
 */
export async function getAdminSession(): Promise<{ user: AdminUser; session: AdminSession } | null> {
  const session = await readSessionCookie();
  if (!session) return null;

  // Cookie refresh belongs in proxy.ts, where response cookies can be written.
  // A Server Component must not try to mutate cookies while rendering.
  if (session.expires_at && session.expires_at * 1000 <= Date.now()) return null;

  const user = await fetchSupabaseUser(session.access_token);
  if (!user?.id) return null;

  const email = user.email || session.email;
  const allowed = await isAdminAccount(user.id, email, user.app_metadata);
  if (!allowed) return null;

  const { data: profile } = await getAdminDb()
    .from("profiles")
    .select("display_name, account_type")
    .eq("user_id", user.id)
    .maybeSingle();

  return {
    session,
    user: {
      id: user.id,
      email,
      displayName: profile?.display_name || email.split("@")[0] || "Quản trị viên",
    },
  };
}

export async function requireAdmin() {
  const admin = await getAdminSession();
  if (!admin) {
    redirect("/admin/login");
  }
  return admin;
}
