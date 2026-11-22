const express = require("express");
const cors = require("cors");
require("dotenv").config();
const { supabase } = require("./supabaseClient");

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

app.listen(PORT, () => {
  console.log(`Backend running at http://0.0.0.0:${PORT}`);
});
