import { NextRequest, NextResponse } from "next/server";

const ADMIN_COOKIE = "cg_admin_session";
const REFRESH_MARGIN_SECONDS = 60;

type StoredAdminSession = {
  access_token: string;
  refresh_token: string;
  expires_at: number;
  email: string;
};

function decodeSession(value: string): StoredAdminSession | null {
  try {
    const parsed = JSON.parse(Buffer.from(value, "base64url").toString("utf8")) as StoredAdminSession;
    if (!parsed.access_token || !parsed.refresh_token || !parsed.email) return null;
    return parsed;
  } catch {
    return null;
  }
}

function encodeSession(session: StoredAdminSession) {
  return Buffer.from(JSON.stringify(session), "utf8").toString("base64url");
}

export async function proxy(request: NextRequest) {
  const pathname = request.nextUrl.pathname;
  if (!pathname.startsWith("/admin") || pathname === "/admin/login") return NextResponse.next();

  const rawSession = request.cookies.get(ADMIN_COOKIE)?.value;
  const session = rawSession ? decodeSession(rawSession) : null;
  if (!session || session.expires_at > Math.floor(Date.now() / 1000) + REFRESH_MARGIN_SECONDS) {
    return NextResponse.next();
  }

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL?.replace(/\/$/, "");
  const publicKey = process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!supabaseUrl || !publicKey) return NextResponse.next();

  try {
    const refreshResponse = await fetch(`${supabaseUrl}/auth/v1/token?grant_type=refresh_token`, {
      method: "POST",
      headers: { apikey: publicKey, "Content-Type": "application/json" },
      body: JSON.stringify({ refresh_token: session.refresh_token }),
      cache: "no-store",
    });

    if (!refreshResponse.ok) return NextResponse.next();

    const refreshed = (await refreshResponse.json()) as {
      access_token?: string;
      refresh_token?: string;
      expires_at?: number;
      expires_in?: number;
      user?: { email?: string };
    };
    if (!refreshed.access_token || !refreshed.refresh_token) return NextResponse.next();

    const nextSession: StoredAdminSession = {
      access_token: refreshed.access_token,
      refresh_token: refreshed.refresh_token,
      expires_at: refreshed.expires_at ?? Math.floor(Date.now() / 1000) + (refreshed.expires_in ?? 3600),
      email: refreshed.user?.email || session.email,
    };

    // Update the request cookie for this render and persist the rotated refresh token.
    request.cookies.set(ADMIN_COOKIE, encodeSession(nextSession));
    const response = NextResponse.next({ request });
    response.cookies.set(ADMIN_COOKIE, encodeSession(nextSession), {
      httpOnly: true,
      sameSite: "lax",
      secure: process.env.NODE_ENV === "production",
      path: "/",
      maxAge: 60 * 60 * 8,
    });
    return response;
  } catch {
    // Keep the current session cookie intact on transient Supabase/network errors.
    return NextResponse.next();
  }
}

export const config = {
  matcher: ["/admin/:path*"],
};
