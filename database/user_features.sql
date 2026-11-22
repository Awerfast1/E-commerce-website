-- Supabase SQL Editor migration for the current database schema.
-- Existing user features already have tables: profiles, customer_addresses,
-- shopping_carts, cart_items, wishlists, wishlist_items, orders/order_items,
-- notifications, reviews, support, payments, and shipping.
-- This migration reuses them and adds only activity history, student verification,
-- and an optional recently viewed list. Login credentials stay in auth.users.

-- Current profiles schema uses user_id and display_name (not id/full_name).
create or replace function public.create_profile_for_new_auth_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.profiles (user_id, display_name)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'display_name', new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name')
  )
  on conflict (user_id) do nothing;
  return new;
end;
$$;

-- Backfill accounts that existed before this trigger was installed.
insert into public.profiles (user_id, display_name)
select
  u.id,
  coalesce(u.raw_user_meta_data ->> 'display_name', u.raw_user_meta_data ->> 'full_name', u.raw_user_meta_data ->> 'name')
from auth.users as u
on conflict (user_id) do nothing;

drop trigger if exists auth_user_created_profile on auth.users;
create trigger auth_user_created_profile
  after insert on auth.users
  for each row execute function public.create_profile_for_new_auth_user();

create table if not exists public.user_activity_logs (
  activity_id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(user_id) on delete cascade,
  event_type text not null,
  description text,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
create index if not exists user_activity_logs_user_created_idx
  on public.user_activity_logs(user_id, created_at desc);

create table if not exists public.student_verifications (
  verification_id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(user_id) on delete cascade,
  school_name text not null,
  student_email text,
  status text not null default 'PENDING'
    check (status in ('PENDING', 'VERIFIED', 'REJECTED', 'EXPIRED')),
  verified_at timestamptz,
  expires_at timestamptz,
  reviewer_note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create unique index if not exists student_verifications_one_pending_per_user
  on public.student_verifications(user_id) where status = 'PENDING';

create table if not exists public.recently_viewed_products (
  user_id uuid not null references public.profiles(user_id) on delete cascade,
  product_id uuid not null references public.products(product_id) on delete cascade,
  viewed_at timestamptz not null default now(),
  primary key (user_id, product_id)
);
create index if not exists recently_viewed_products_user_viewed_idx
  on public.recently_viewed_products(user_id, viewed_at desc);

create or replace function public.set_student_verification_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;
drop trigger if exists student_verifications_set_updated_at on public.student_verifications;
create trigger student_verifications_set_updated_at before update on public.student_verifications
  for each row execute function public.set_student_verification_updated_at();

-- Enable row-level protection for profile data and the newly added user tables.
alter table public.profiles enable row level security;
alter table public.user_activity_logs enable row level security;
alter table public.student_verifications enable row level security;
alter table public.recently_viewed_products enable row level security;

-- Restrictive guards prevent an older permissive policy from exposing another user's rows.
drop policy if exists profiles_owner_guard on public.profiles;
create policy profiles_owner_guard on public.profiles as restrictive for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
drop policy if exists profiles_read_own on public.profiles;
create policy profiles_read_own on public.profiles for select to authenticated
  using (user_id = (select auth.uid()));
drop policy if exists profiles_update_own on public.profiles;
create policy profiles_update_own on public.profiles for update to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
revoke update on public.profiles from authenticated;
grant select on public.profiles to authenticated;
grant update (display_name, phone) on public.profiles to authenticated;

drop policy if exists activity_owner_guard on public.user_activity_logs;
create policy activity_owner_guard on public.user_activity_logs as restrictive for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
drop policy if exists activity_read_own on public.user_activity_logs;
create policy activity_read_own on public.user_activity_logs for select to authenticated
  using (user_id = (select auth.uid()));
drop policy if exists activity_insert_own on public.user_activity_logs;
create policy activity_insert_own on public.user_activity_logs for insert to authenticated
  with check (user_id = (select auth.uid()));

drop policy if exists student_verifications_owner_guard on public.student_verifications;
create policy student_verifications_owner_guard on public.student_verifications as restrictive for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
drop policy if exists student_verifications_read_own on public.student_verifications;
create policy student_verifications_read_own on public.student_verifications for select to authenticated
  using (user_id = (select auth.uid()));
drop policy if exists student_verifications_submit_own on public.student_verifications;
create policy student_verifications_submit_own on public.student_verifications for insert to authenticated
  with check (user_id = (select auth.uid()) and status = 'PENDING');

drop policy if exists recent_products_owner_guard on public.recently_viewed_products;
create policy recent_products_owner_guard on public.recently_viewed_products as restrictive for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
drop policy if exists recent_products_manage_own on public.recently_viewed_products;
create policy recent_products_manage_own on public.recently_viewed_products for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

revoke all on public.user_activity_logs, public.student_verifications, public.recently_viewed_products from anon;
grant usage on schema public to authenticated;
grant select, insert on public.user_activity_logs to authenticated;
grant select on public.student_verifications to authenticated;
grant insert (user_id, school_name, student_email) on public.student_verifications to authenticated;
grant select, insert, update, delete on public.recently_viewed_products to authenticated;

-- Activity history is user-facing history, not an authoritative security audit log.
-- Student proof files should be stored in a private Supabase Storage bucket.
