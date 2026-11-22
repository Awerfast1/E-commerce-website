const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const secret = process.env.SUPABASE_SECRET_KEY;
const email = process.argv[2] || "admin@congears.vn";
const password = process.argv[3] || "Congears@2026";
const H = { apikey: secret, Authorization: `Bearer ${secret}`, "Content-Type": "application/json" };

const list = await (await fetch(`${url}/auth/v1/admin/users?per_page=200`, { headers: H })).json();
let user = (list.users || []).find((u) => u.email?.toLowerCase() === email.toLowerCase());

if (!user) {
  const res = await fetch(`${url}/auth/v1/admin/users`, {
    method: "POST",
    headers: H,
    body: JSON.stringify({ email, password, email_confirm: true, app_metadata: { role: "ADMIN" } }),
  });
  const body = await res.json();
  if (!res.ok) { console.error("create failed:", body); process.exit(1); }
  user = body;
  console.log("created auth user:", user.email, user.id);
} else {
  console.log("auth user already exists:", user.email, user.id);
}

const existing = await (await fetch(`${url}/rest/v1/profiles?select=user_id,display_name,account_type&user_id=eq.${user.id}`, { headers: H })).json();
const payload = { user_id: user.id, display_name: "Quản trị viên", account_type: "ADMIN", account_status: "ACTIVE", updated_at: new Date().toISOString() };
const res = existing.length
  ? await fetch(`${url}/rest/v1/profiles?user_id=eq.${user.id}`, { method: "PATCH", headers: H, body: JSON.stringify(payload) })
  : await fetch(`${url}/rest/v1/profiles`, { method: "POST", headers: H, body: JSON.stringify({ ...payload, created_at: new Date().toISOString() }) });
console.log("profile update:", res.status, (await res.text()).slice(0, 200));

const check = await (await fetch(`${url}/rest/v1/profiles?select=display_name,account_type,account_status&user_id=eq.${user.id}`, { headers: H })).json();
console.log("profile now:", JSON.stringify(check));
