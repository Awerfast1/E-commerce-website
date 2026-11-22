# Admin console setup

The admin console uses Supabase Auth for sign-in and a server-only Supabase secret to manage database records.

Configure these variables in `frontend/.env.local` for local development and in the frontend container's runtime environment on the server:

```dotenv
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-public-anon-key
SUPABASE_SECRET_KEY=your-server-only-secret-key
ADMIN_EMAILS=admin@example.com
NEXT_PUBLIC_API_URL=http://localhost:5000
```

`SUPABASE_SECRET_KEY` must never use the `NEXT_PUBLIC_` prefix and must not be committed. `ADMIN_EMAILS` is a comma-separated allowlist. An account can also receive admin access through `profiles.account_type = 'ADMIN'` and `profiles.account_status = 'ACTIVE'`.

The current storefront can read the legacy `products(id, name, price, category)` table. The full admin catalog editor expects the normalized schema used by `frontend/lib/admin/config.ts` and `frontend/lib/store/catalog.ts`, including related tables such as `categories`, `brands`, `product_variants`, `product_specifications`, and `product_images`. Apply or create that schema before using catalog management in the admin console.
