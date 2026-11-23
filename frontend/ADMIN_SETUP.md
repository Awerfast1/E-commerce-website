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

`SUPABASE_SECRET_KEY` must never use the `NEXT_PUBLIC_` prefix and must not be committed. The application also accepts `SUPABASE_SERVICE_ROLE_KEY` as an alias. `ADMIN_EMAILS` is a comma-separated allowlist. An account can also receive admin access through `profiles.account_type = 'ADMIN'` and `profiles.account_status = 'ACTIVE'`.

## Database schema expected by storefront and admin

The supplied Supabase schema snapshot uses the normalized catalog and matches the current catalog and admin code:

- `products(product_id, brand_id, category_id, product_name, slug, short_description, description, is_active, is_featured, created_at, updated_at)`
- `categories(category_id, parent_category_id, category_name, slug, description, image_url, is_active, display_order)`
- `brands(brand_id, brand_name, description, logo_url, is_active, created_at)`
- `product_variants(variant_id, product_id, sku, variant_name, price, compare_at_price, is_active, created_at)`
- `product_images(image_id, product_id, image_url, alt_text, display_order, is_primary)`
- `product_specifications(specification_id, product_id, specification_name, specification_value, display_order)`

The admin also expects the user, cart, order, inventory, payment, shipping, return, review, notification, and support tables represented in that snapshot. Its table configuration is in `frontend/lib/admin/config.ts`; the dashboard reads `products`, `categories`, `brands`, `profiles`, `orders`, `inventory`, `product_reviews`, `returns`, `order_items`, `warehouses`, `product_variants`, and related rows.

No catalog migration is needed if the live Supabase project has this schema. The attachment is a schema snapshot, however, so verify it reflects the live project before enabling admin CRUD. If the live project still has only `products(id, name, price, category)`, the storefront has a legacy read fallback but admin catalog CRUD does not support that flat shape. Keep that legacy table/data until a reviewed migration has copied it into the normalized catalog; do not rename or drop it as part of this setup.

The snapshot does not include RLS policies. Public storefront reads need suitable `SELECT` policies for anonymous users if RLS is enabled. Admin mutations run server-side with the secret key, which bypasses RLS; never expose that key to client code or commit it.

## Create or promote an administrator

The script requires the Supabase URL and server-only secret, then checks Supabase Auth access and the required `profiles` columns before it changes anything. If the email does not belong to an Auth user yet, it prompts for a password without echoing it. The password must be at least 16 characters and include lowercase, uppercase, a number, and a symbol; it must be confirmed and must not contain the email name. The password is not passed as a command-line argument or stored by the script.

```powershell
node --env-file=.env.local scripts/create-admin.mjs admin@example.com
```

The script creates an Auth user if one does not exist, then promotes/creates the matching `profiles` row using the schema's `user_id`, `display_name`, `account_type`, and `account_status` columns. For an existing Auth user, it does not ask for or reset the password. An existing profile is preserved except for the fields needed to promote the account. The script only checks schema readiness; it does not run against Supabase unless you explicitly execute it.
