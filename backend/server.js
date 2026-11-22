const express = require("express");
const cors = require("cors");
require("dotenv").config();
const { supabase, createAuthClient } = require("./supabaseClient");

const app = express();
const PORT = process.env.PORT || 5000;

console.log("Starting E-commerce Backend...");

// Mở CORS cho phép Frontend gọi API
app.use(cors());
app.use(express.json());

// Root endpoint
app.get("/", (req, res) => {
  res.send("E-commerce Backend is running!");
});

// Liveness check (Nhanh, dùng cho Docker & CI/CD workflow)
app.get(["/health", "/api/health"], (req, res) => {
  res.status(200).json({
    status: "OK",
    uptime: process.uptime(),
    timestamp: new Date().toISOString(),
    message: "Backend is working!",
  });
});

// Readiness & Monitoring check (Kiểm tra kết nối sâu tới Supabase database)
app.get(["/health/db", "/api/health/db"], async (req, res) => {
  const startTime = Date.now();
  try {
    // Ping Supabase bằng truy vấn lightweight
    const { error } = await supabase.from("_health_check_nonexistent_table").select("*").limit(0);

    // Lưu ý: Nếu bảng chưa tồn tại nhưng Supabase phản hồi mã lỗi PGRST (PostgREST),
    // chứng tỏ kết nối mạng và authentication tới Supabase hoạt động hoàn hảo!
    const responseTimeMs = Date.now() - startTime;

    if (error && error.code && !error.code.startsWith("PGRST")) {
      return res.status(503).json({
        status: "DEGRADED",
        database: "SUPABASE_ERROR",
        error: error.message,
        responseTimeMs,
        timestamp: new Date().toISOString(),
      });
    }

    res.status(200).json({
      status: "HEALTHY",
      database: "CONNECTED",
      supabaseUrl: process.env.SUPABASE_URL,
      responseTimeMs,
      timestamp: new Date().toISOString(),
    });
  } catch (err) {
    res.status(503).json({
      status: "UNHEALTHY",
      database: "DISCONNECTED",
      error: err.message || "Unknown error",
      timestamp: new Date().toISOString(),
    });
  }
});

function publicAuthUser(user) {
  if (!user) return null;
  return {
    id: user.id,
    email: user.email || null,
    phone: user.phone || null,
    user_metadata: {
      display_name: user.user_metadata?.display_name || user.user_metadata?.full_name || "",
    },
  };
}

function authErrorMessage(error) {
  const message = String(error?.message || "");
  if (/invalid login credentials/i.test(message)) return "Email/số điện thoại hoặc mật khẩu chưa đúng.";
  if (/already registered|already been registered/i.test(message)) return "Tài khoản này đã được đăng ký.";
  if (/password/i.test(message) && /length|characters|weak/i.test(message)) return "Mật khẩu chưa đủ mạnh, hãy dùng ít nhất 6 ký tự.";
  return message || "Không thể xử lý yêu cầu xác thực lúc này.";
}

function authFailure(res, error) {
  const status = Number(error?.status) || 400;
  return res.status(status >= 400 && status < 500 ? status : 400).json({
    error: authErrorMessage(error),
  });
}

function getAuthIdentifier(identifier) {
  const value = typeof identifier === "string" ? identifier.trim() : "";
  if (!value) return null;
  if (value.includes("@")) return { email: value };

  const phone = value.replace(/[\s().-]/g, "");
  if (/^0\d{9,10}$/.test(phone)) return { phone: `+84${phone.slice(1)}` };
  if (/^84\d{9,10}$/.test(phone)) return { phone: `+${phone}` };
  if (/^\+\d{8,15}$/.test(phone)) return { phone };
  return { phone };
}

app.post("/api/auth/register", async (req, res) => {
  const { displayName, identifier, password, redirectTo } = req.body || {};
  const credentials = getAuthIdentifier(identifier);
  if (typeof displayName !== "string" || !displayName.trim() || !credentials || typeof password !== "string" || password.length < 6) {
    return res.status(400).json({ error: "Vui lòng nhập họ tên, email/số điện thoại và mật khẩu từ 6 ký tự." });
  }

  try {
    const { data, error } = await createAuthClient().auth.signUp({
      ...credentials,
      password,
      options: {
        data: { display_name: displayName.trim() },
        ...(credentials.email && typeof redirectTo === "string" ? { emailRedirectTo: redirectTo } : {}),
      },
    });
    if (error) return authFailure(res, error);
    if (data.user?.identities?.length === 0) {
      return res.status(409).json({ error: "Email hoặc số điện thoại này đã được đăng ký." });
    }

    res.status(201).json({
      user: publicAuthUser(data.user),
      session: data.session,
      requiresConfirmation: !data.session,
    });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.post("/api/auth/login", async (req, res) => {
  const { identifier, password } = req.body || {};
  const credentials = getAuthIdentifier(identifier);
  if (!credentials || typeof password !== "string" || !password) {
    return res.status(400).json({ error: "Vui lòng nhập email/số điện thoại và mật khẩu." });
  }

  try {
    const { data, error } = await createAuthClient().auth.signInWithPassword({ ...credentials, password });
    if (error) return authFailure(res, error);
    res.json({ user: publicAuthUser(data.user), session: data.session });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.post("/api/auth/verify-otp", async (req, res) => {
  const { identifier, token } = req.body || {};
  const credentials = getAuthIdentifier(identifier);
  if (!credentials || typeof token !== "string" || !/^\d{6,8}$/.test(token.trim())) {
    return res.status(400).json({ error: "Vui lòng nhập mã xác nhận hợp lệ." });
  }

  try {
    const authClient = createAuthClient();
    const { data, error } = await authClient.auth.verifyOtp({
      ...credentials,
      token: token.trim(),
      type: credentials.email ? "email" : "sms",
    });
    if (error) return authFailure(res, error);
    res.json({ user: publicAuthUser(data.user), session: data.session });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.post("/api/auth/refresh", async (req, res) => {
  const refreshToken = req.body?.refreshToken;
  if (typeof refreshToken !== "string" || !refreshToken) {
    return res.status(400).json({ error: "Phiên đăng nhập đã hết hạn." });
  }

  try {
    const { data, error } = await createAuthClient().auth.refreshSession({ refresh_token: refreshToken });
    if (error) return authFailure(res, error);
    res.json({ user: publicAuthUser(data.user), session: data.session });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.get("/api/auth/me", async (req, res) => {
  const accessToken = req.get("authorization")?.replace(/^Bearer\s+/i, "");
  if (!accessToken) return res.status(401).json({ error: "Chưa đăng nhập." });

  try {
    const { data, error } = await createAuthClient().auth.getUser(accessToken);
    if (error) return authFailure(res, error);
    res.json({ user: publicAuthUser(data.user) });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.post("/api/auth/logout", async (req, res) => {
  const accessToken = req.get("authorization")?.replace(/^Bearer\s+/i, "");
  if (!accessToken || !process.env.SUPABASE_URL || !process.env.SUPABASE_ANON_KEY) return res.sendStatus(204);

  try {
    const response = await fetch(`${process.env.SUPABASE_URL}/auth/v1/logout`, {
      method: "POST",
      headers: {
        apikey: process.env.SUPABASE_ANON_KEY,
        Authorization: `Bearer ${accessToken}`,
      },
    });
    if (!response.ok) console.warn("Supabase logout returned status:", response.status);
    res.sendStatus(204);
  } catch {
    res.sendStatus(204);
  }
});

app.post("/api/auth/forgot-password", async (req, res) => {
  const identifier = getAuthIdentifier(req.body?.identifier);
  if (!identifier?.email) return res.status(400).json({ error: "Nhập email để nhận liên kết đặt lại mật khẩu." });

  try {
    const redirectTo = typeof req.body?.redirectTo === "string" ? req.body.redirectTo : undefined;
    const { error } = await createAuthClient().auth.resetPasswordForEmail(
      identifier.email,
      redirectTo ? { redirectTo } : undefined,
    );
    if (error) return authFailure(res, error);
    res.json({ message: "Nếu email đã đăng ký, hướng dẫn đặt lại mật khẩu sẽ được gửi đến hộp thư." });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.post("/api/auth/update-password", async (req, res) => {
  const accessToken = req.get("authorization")?.replace(/^Bearer\s+/i, "");
  const password = req.body?.password;
  if (!accessToken) return res.status(401).json({ error: "Liên kết đặt lại mật khẩu không hợp lệ hoặc đã hết hạn." });
  if (typeof password !== "string" || password.length < 6) {
    return res.status(400).json({ error: "Mật khẩu mới cần có ít nhất 6 ký tự." });
  }
  if (!process.env.SUPABASE_URL || !process.env.SUPABASE_ANON_KEY) {
    return res.status(503).json({ error: "Supabase chưa được cấu hình." });
  }

  try {
    const response = await fetch(`${process.env.SUPABASE_URL}/auth/v1/user`, {
      method: "PUT",
      headers: {
        apikey: process.env.SUPABASE_ANON_KEY,
        Authorization: `Bearer ${accessToken}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ password }),
    });
    const data = await response.json().catch(() => ({}));
    if (!response.ok) return res.status(response.status).json({ error: authErrorMessage(data) });
    res.json({ user: publicAuthUser(data) });
  } catch (error) {
    res.status(503).json({ error: authErrorMessage(error) });
  }
});

app.listen(PORT, () => {
  console.log(`Backend running at http://0.0.0.0:${PORT}`);
});
