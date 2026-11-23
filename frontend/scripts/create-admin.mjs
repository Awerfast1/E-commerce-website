const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const secret = process.env.SUPABASE_SECRET_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY;
const email = process.argv[2]?.trim();

if (!url || !secret || !email) {
  console.error(
    "Usage: node --env-file=.env.local scripts/create-admin.mjs <email>\n" +
      "Required env: NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SECRET_KEY (or SUPABASE_SERVICE_ROLE_KEY).",
  );
  process.exit(1);
}

try {
  new URL(url);
} catch {
  console.error("NEXT_PUBLIC_SUPABASE_URL must be a valid URL.");
  process.exit(1);
}

if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
  console.error("Enter a valid email address.");
  process.exit(1);
}

const baseUrl = url.replace(/\/$/, "");
const headers = {
  apikey: secret,
  Authorization: `Bearer ${secret}`,
  "Content-Type": "application/json",
};

async function request(path, options = {}) {
  const response = await fetch(`${baseUrl}${path}`, {
    ...options,
    headers: { ...headers, ...options.headers },
  });
  const text = await response.text();
  let body;
  try {
    body = text ? JSON.parse(text) : null;
  } catch {
    body = text;
  }

  if (!response.ok) {
    throw new Error(`Supabase request failed (${response.status}): ${JSON.stringify(body)}`);
  }
  return body;
}

function readHidden(prompt) {
  if (!process.stdin.isTTY || !process.stdout.isTTY || typeof process.stdin.setRawMode !== "function") {
    throw new Error("Password input requires an interactive terminal; run this script directly in a terminal.");
  }

  return new Promise((resolve, reject) => {
    let value = "";
    process.stdout.write(prompt);
    process.stdin.setRawMode(true);
    process.stdin.resume();
    process.stdin.setEncoding("utf8");

    const finish = (error) => {
      process.stdin.off("data", onData);
      process.stdin.setRawMode(false);
      process.stdin.pause();
      process.stdout.write("\n");
      if (error) reject(error);
      else resolve(value);
    };

    const onData = (character) => {
      if (character === "\u0003") {
        finish(new Error("Cancelled."));
      } else if (character === "\r" || character === "\n") {
        finish();
      } else if (character === "\u007f" || character === "\b") {
        value = value.slice(0, -1);
      } else if (character >= " ") {
        value += character;
      }
    };

    process.stdin.on("data", onData);
  });
}

function validatePassword(password, confirmation) {
  const checks = [
    [password.length >= 16, "at least 16 characters"],
    [/[a-z]/.test(password), "a lowercase letter"],
    [/[A-Z]/.test(password), "an uppercase letter"],
    [/[0-9]/.test(password), "a number"],
    [/[^A-Za-z0-9]/.test(password), "a symbol"],
    [password === confirmation, "matching confirmation"],
  ];
  const missing = checks.filter(([valid]) => !valid).map(([, requirement]) => requirement);
  if (missing.length) throw new Error(`Password must contain ${missing.join(", ")}.`);

  const emailName = email.split("@")[0];
  if (emailName.length >= 4 && password.toLowerCase().includes(emailName.toLowerCase())) {
    throw new Error("Do not include the email name in the password.");
  }
}

async function getOrCreateAdminUser() {
  for (let page = 1; ; page += 1) {
    const result = await request(`/auth/v1/admin/users?page=${page}&per_page=200`);
    const user = (result.users || []).find((item) => item.email?.toLowerCase() === email.toLowerCase());
    if (user) {
      console.log("Auth account already exists; its password will not be changed.");
      return user;
    }
    if ((result.users || []).length < 200) break;
  }

  const password = await readHidden("New admin password (input hidden): ");
  const confirmation = await readHidden("Confirm password (input hidden): ");
  validatePassword(password, confirmation);

  return request("/auth/v1/admin/users", {
    method: "POST",
    body: JSON.stringify({
      email,
      password,
      email_confirm: true,
      app_metadata: { role: "ADMIN" },
      user_metadata: { display_name: "Quản trị viên" },
    }),
  });
}

async function main() {
  // Preflight both the service credential and the exact profile columns before creating/promoting anything.
  await request("/auth/v1/admin/users?page=1&per_page=1");
  await request("/rest/v1/profiles?select=user_id,display_name,account_type,account_status&limit=0");

  const user = await getOrCreateAdminUser();
  const profilePath = `/rest/v1/profiles?user_id=eq.${encodeURIComponent(user.id)}`;
  const existing = await request(`${profilePath}&select=user_id`);
  const now = new Date().toISOString();
  const profile = {
    user_id: user.id,
    account_type: "ADMIN",
    account_status: "ACTIVE",
    updated_at: now,
  };

  if (existing.length) {
    await request(profilePath, { method: "PATCH", body: JSON.stringify(profile) });
  } else {
    await request("/rest/v1/profiles", {
      method: "POST",
      body: JSON.stringify({ ...profile, display_name: "Quản trị viên", created_at: now }),
    });
  }

  const check = await request(`${profilePath}&select=display_name,account_type,account_status`);
  console.log("Administrator profile:", JSON.stringify(check));
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : "Could not configure the administrator.");
  process.exitCode = 1;
});
