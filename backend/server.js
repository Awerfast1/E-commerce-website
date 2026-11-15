const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

console.log("Hello bruh");

// Mở CORS cho phép Frontend trên AWS EC2 gọi API thoải mái
app.use(cors());

app.use(express.json());

app.get("/", (req, res) => {
    res.send("E-commerce Backend is running!");
});

// Hỗ trợ cả /health (cho GitHub Actions) lẫn /api/health (cho team code)
app.get(["/health", "/api/health"], (req, res) => {
    res.status(200).json({
        status: "OK",
        message: "Backend is working!"
    });
});

app.listen(PORT, () => {
    console.log(`Backend running at http://0.0.0.0:${PORT}`);
});