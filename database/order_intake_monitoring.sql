-- Additive order intake and storefront activity monitoring migration.
-- Keeps existing orders, order_items and user_activity_logs data intact.

alter table public.orders
  add column if not exists client_order_token uuid;

create unique index if not exists orders_user_client_token_uidx
  on public.orders (user_id, client_order_token)
  where client_order_token is not null;

create or replace function public.place_customer_order(
  p_user_id uuid,
  p_client_order_token uuid,
  p_items jsonb,
  p_recipient_name text,
  p_phone text,
  p_address_line text,
  p_ward text default null,
  p_district text default null,
  p_city text default null,
  p_expected_total numeric default null,
  p_customer_note text default null
)
returns table (
  order_id uuid,
  order_code text,
  subtotal numeric,
  discount_amount numeric,
  shipping_fee numeric,
  total_amount numeric
)
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  existing_order public.orders%rowtype;
  created_order public.orders%rowtype;
  item jsonb;
  item_slug text;
  item_quantity integer;
  found_product record;
  calculated_subtotal numeric := 0;
  item_count integer := 0;
begin
  if p_user_id is null or p_client_order_token is null then
    raise exception 'Thông tin tài khoản hoặc mã yêu cầu không hợp lệ.' using errcode = '22023';
  end if;
  if coalesce(auth.role(), '') <> 'service_role' and auth.uid() is distinct from p_user_id then
    raise exception 'Phiên đăng nhập không khớp với tài khoản đặt hàng.' using errcode = '42501';
  end if;
  if p_items is null or jsonb_typeof(p_items) is distinct from 'array' or jsonb_array_length(p_items) = 0 then
    raise exception 'Giỏ hàng đang trống.' using errcode = '22023';
  end if;
  if coalesce(length(trim(p_recipient_name)), 0) = 0
     or coalesce(length(trim(p_phone)), 0) = 0
     or coalesce(length(trim(p_address_line)), 0) = 0
     or coalesce(length(trim(p_city)), 0) = 0 then
    raise exception 'Vui lòng điền đầy đủ thông tin giao hàng.' using errcode = '22023';
  end if;

  perform pg_advisory_xact_lock(hashtextextended(p_user_id::text || p_client_order_token::text, 0));
  select * into existing_order
  from public.orders
  where user_id = p_user_id and client_order_token = p_client_order_token;
  if found then
    return query select existing_order.order_id, existing_order.order_code,
      existing_order.subtotal, existing_order.discount_amount,
      existing_order.shipping_fee, existing_order.total_amount;
    return;
  end if;

  -- Verify every requested item against active catalog rows and use DB prices.
  for item in select value from jsonb_array_elements(p_items)
  loop
    item_slug := trim(coalesce(item ->> 'slug', ''));
    begin
      item_quantity := (item ->> 'quantity')::integer;
    exception when others then
      raise exception 'Số lượng sản phẩm không hợp lệ.' using errcode = '22023';
    end;
    if item_slug = '' or item_quantity is null or item_quantity < 1 or item_quantity > 20 then
      raise exception 'Sản phẩm hoặc số lượng không hợp lệ.' using errcode = '22023';
    end if;

    select p.product_id, p.product_name, v.variant_id, v.variant_name, v.sku, v.price
      into found_product
    from public.products p
    join public.product_variants v on v.product_id = p.product_id
    where p.slug = item_slug and p.is_active = true and v.is_active = true
    order by v.price asc
    limit 1;
    if not found then
      raise exception 'Sản phẩm % hiện không thể đặt hàng. Vui lòng cập nhật giỏ hàng.', item_slug
        using errcode = 'P0002';
    end if;

    calculated_subtotal := calculated_subtotal + found_product.price * item_quantity;
    item_count := item_count + 1;
  end loop;

  if p_expected_total is not null and calculated_subtotal <> p_expected_total then
    raise exception 'Giá sản phẩm vừa thay đổi. Vui lòng kiểm tra lại đơn hàng.' using errcode = 'P0003';
  end if;

  insert into public.orders (
    order_code, user_id, order_status, subtotal, discount_amount,
    shipping_fee, total_amount, customer_note, placed_at, updated_at,
    client_order_token
  ) values (
    'CG-' || to_char(now(), 'YYMMDD') || '-' || upper(substr(replace(gen_random_uuid()::text, '-', ''), 1, 8)),
    p_user_id, 'PENDING', calculated_subtotal, 0, 0, calculated_subtotal,
    nullif(trim(coalesce(p_customer_note, '')), ''), now(), now(), p_client_order_token
  ) returning * into created_order;

  for item in select value from jsonb_array_elements(p_items)
  loop
    item_slug := trim(coalesce(item ->> 'slug', ''));
    item_quantity := (item ->> 'quantity')::integer;
    select p.product_name, v.variant_id, v.variant_name, v.sku, v.price
      into found_product
    from public.products p
    join public.product_variants v on v.product_id = p.product_id
    where p.slug = item_slug and p.is_active = true and v.is_active = true
    order by v.price asc
    limit 1;

    insert into public.order_items (
      order_id, variant_id, product_name_snapshot, variant_name_snapshot,
      sku_snapshot, unit_price, quantity, line_total
    ) values (
      created_order.order_id, found_product.variant_id, found_product.product_name,
      found_product.variant_name, found_product.sku, found_product.price,
      item_quantity, found_product.price * item_quantity
    );
  end loop;

  insert into public.order_addresses (
    order_id, recipient_name, phone, address_line, ward, district, city, country
  ) values (
    created_order.order_id, trim(p_recipient_name), trim(p_phone), trim(p_address_line),
    nullif(trim(coalesce(p_ward, '')), ''), nullif(trim(coalesce(p_district, '')), ''),
    trim(p_city), 'Vietnam'
  );

  insert into public.user_activity_logs (user_id, event_type, description, metadata)
  values (
    p_user_id, 'order_placed', 'Khách hàng đã gửi đơn đặt hàng.',
    jsonb_build_object('order_id', created_order.order_id, 'order_code', created_order.order_code,
      'item_count', item_count, 'total_amount', created_order.total_amount)
  );

  delete from public.cart_items ci
  using public.shopping_carts sc, public.product_variants v, public.products p
  where ci.cart_id = sc.cart_id
    and ci.variant_id = v.variant_id
    and v.product_id = p.product_id
    and sc.user_id = p_user_id
    and p.slug in (select value ->> 'slug' from jsonb_array_elements(p_items));
  update public.shopping_carts set updated_at = now() where user_id = p_user_id;

  return query select created_order.order_id, created_order.order_code,
    created_order.subtotal, created_order.discount_amount,
    created_order.shipping_fee, created_order.total_amount;
end;
$$;

revoke all on function public.place_customer_order(uuid, uuid, jsonb, text, text, text, text, text, text, numeric, text) from public, anon;
grant execute on function public.place_customer_order(uuid, uuid, jsonb, text, text, text, text, text, text, numeric, text) to authenticated, service_role;

