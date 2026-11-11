
const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

console.log("Hello bruh")

app.use(cors({
    origin: "http://localhost:3000"
}));

app.use(express.json());

app.get("/", (req, res) => {
    res.send("E-commerce Backend is running!");
});

app.get("/api/health", (req, res) => {
    res.json({
        status: "OK",
        message: "Backend is working!"
    });
});

app.listen(PORT, () => {
    console.log(`Backend running at http://localhost:${PORT}`);
});
