import { NextRequest, NextResponse } from "next/server";

const ACCESS_COOKIE = "congears_access_token";
const REFRESH_COOKIE = "congears_refresh_token";
const REMEMBER_COOKIE = "congears_remember_session";

type AuthSession = {
  access_token?: string;
  refresh_token?: string;
  expires_in?: number;
};

type RouteContext = { params: Promise<{ action: string }> };

function backendUrl() {
  const base = process.env.NEXT_PUBLIC_API_URL?.replace(/\/$/, "");
  if (!base) throw new Error("NEXT_PUBLIC_API_URL chưa được cấu hình.");
  return base;
}

async function callBackend(path: string, init?: RequestInit) {
  return fetch(`${backendUrl()}${path}`, {
    ...init,
    cache: "no-store",
    headers: { "Content-Type": "application/json", ...init?.headers },
  });
}

function applySessionCookies(
  response: NextResponse,
  session?: AuthSession | null,
  rememberMe = false,
  secure = false,
) {
  if (!session?.access_token || !session.refresh_token) return response;
  response.cookies.set(ACCESS_COOKIE, session.access_token, {
    httpOnly: true,
    secure,
    sameSite: "lax",
    path: "/",
    ...(rememberMe ? { maxAge: Math.max(60, session.expires_in || 3600) } : {}),
  });
  response.cookies.set(REFRESH_COOKIE, session.refresh_token, {
    httpOnly: true,
    secure,
    sameSite: "lax",
    path: "/",
    ...(rememberMe ? { maxAge: 60 * 60 * 24 * 30 } : {}),
  });
  response.cookies.set(REMEMBER_COOKIE, rememberMe ? "1" : "0", {
    httpOnly: true,
    secure,
    sameSite: "lax",
    path: "/",
    ...(rememberMe ? { maxAge: 60 * 60 * 24 * 30 } : {}),
  });
  return response;
}

function clearSessionCookies(response: NextResponse, secure = false) {
  response.cookies.set(ACCESS_COOKIE, "", { httpOnly: true, secure, path: "/", maxAge: 0 });
  response.cookies.set(REFRESH_COOKIE, "", { httpOnly: true, secure, path: "/", maxAge: 0 });
  response.cookies.set(REMEMBER_COOKIE, "", { httpOnly: true, secure, path: "/", maxAge: 0 });
  return response;
}

async function readBackendResponse(response: Response) {
  try {
    return await response.json();
  } catch {
    return { error: "Máy chủ xác thực trả về phản hồi không hợp lệ." };
  }
}

export async function POST(request: NextRequest, context: RouteContext) {
  const { action } = await context.params;
  const secureCookies = request.nextUrl.protocol === "https:";

  if (!["login", "register", "verify-otp", "logout", "forgot-password", "callback", "update-password"].includes(action)) {
    return NextResponse.json({ error: "Không tìm thấy thao tác xác thực." }, { status: 404 });
  }

  try {
    if (action === "logout") {
      const accessToken = request.cookies.get(ACCESS_COOKIE)?.value;
      if (accessToken) {
        await callBackend("/api/auth/logout", {
          method: "POST",
          headers: { Authorization: `Bearer ${accessToken}` },
        });
      }
      return clearSessionCookies(new NextResponse(null, { status: 204 }), secureCookies);
    }

    const body = await request.json();
    if (action === "callback") {
      const accessToken = typeof body.accessToken === "string" ? body.accessToken : "";
      const refreshToken = typeof body.refreshToken === "string" ? body.refreshToken : "";
      if (!accessToken || !refreshToken) {
        return NextResponse.json({ error: "Liên kết xác nhận không hợp lệ hoặc đã hết hạn." }, { status: 400 });
      }
      const userResponse = await callBackend("/api/auth/me", {
        headers: { Authorization: `Bearer ${accessToken}` },
      });
      const result = await readBackendResponse(userResponse);
      if (!userResponse.ok) return NextResponse.json(result, { status: userResponse.status });
      return applySessionCookies(
        NextResponse.json({ user: result.user }),
        { access_token: accessToken, refresh_token: refreshToken },
        true,
        secureCookies,
      );
    }

    if (action === "update-password") {
      const accessToken = request.cookies.get(ACCESS_COOKIE)?.value;
      if (!accessToken) return NextResponse.json({ error: "Liên kết đặt lại mật khẩu không hợp lệ hoặc đã hết hạn." }, { status: 401 });
      const backendResponse = await callBackend("/api/auth/update-password", {
        method: "POST",
        headers: { Authorization: `Bearer ${accessToken}` },
        body: JSON.stringify(body),
      });
      const result = await readBackendResponse(backendResponse);
      return NextResponse.json(result, { status: backendResponse.status });
    }

    if (action === "register" && typeof body.identifier === "string" && body.identifier.includes("@")) {
      body.redirectTo = new URL("/auth/callback", request.nextUrl.origin).toString();
    }
    if (action === "forgot-password") {
      body.redirectTo = new URL("/dat-lai-mat-khau", request.nextUrl.origin).toString();
    }
    const backendResponse = await callBackend(`/api/auth/${action}`, {
      method: "POST",
      body: JSON.stringify(body),
    });
    const result = await readBackendResponse(backendResponse);
    const { session, ...publicResult } = result;
    const response = NextResponse.json(publicResult, { status: backendResponse.status });
    return action === "login" || action === "register" || action === "verify-otp"
      ? applySessionCookies(response, session, action === "login" && body.rememberMe === true, secureCookies)
      : response;
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Không thể kết nối máy chủ xác thực." },
      { status: 503 },
    );
  }
}

export async function GET(_request: NextRequest, context: RouteContext) {
  const { action } = await context.params;
  const secureCookies = _request.nextUrl.protocol === "https:";
  if (action !== "session") return NextResponse.json({ error: "Không tìm thấy thao tác xác thực." }, { status: 404 });

  const accessToken = _request.cookies.get(ACCESS_COOKIE)?.value;
  if (!accessToken) return NextResponse.json({ user: null });

  try {
    const userResponse = await callBackend("/api/auth/me", {
      headers: { Authorization: `Bearer ${accessToken}` },
    });
    if (userResponse.ok) return NextResponse.json(await readBackendResponse(userResponse));

    const refreshToken = _request.cookies.get(REFRESH_COOKIE)?.value;
    if (refreshToken) {
      const refreshResponse = await callBackend("/api/auth/refresh", {
        method: "POST",
        body: JSON.stringify({ refreshToken }),
      });
      const result = await readBackendResponse(refreshResponse);
      if (refreshResponse.ok && result.session?.access_token) {
        const rememberMe = _request.cookies.get(REMEMBER_COOKIE)?.value === "1";
        return applySessionCookies(NextResponse.json({ user: result.user }), result.session, rememberMe, secureCookies);
      }
    }

    return clearSessionCookies(NextResponse.json({ user: null }), secureCookies);
  } catch {
    return NextResponse.json({ error: "Không thể kiểm tra phiên đăng nhập." }, { status: 503 });
  }
}
