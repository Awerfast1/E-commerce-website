export type FieldType =
  | "text"
  | "textarea"
  | "number"
  | "boolean"
  | "datetime"
  | "date"
  | "select"
  | "relation"
  | "email";

export type Option = { value: string; label: string };

export type Relation = {
  /** Table to load options from. */
  table: string;
  /** Column shown inside the <select>. */
  label: string;
  /** Column used as the value (defaults to the table primary key). */
  value?: string;
  /** PostgREST embed name used by lists, e.g. `brands`. */
  embed?: string;
};

export type Field = {
  name: string;
  label: string;
  type: FieldType;
  required?: boolean;
  readOnly?: boolean;
  hideInList?: boolean;
  hideInForm?: boolean;
  placeholder?: string;
  help?: string;
  options?: Option[];
  relation?: Relation;
  defaultValue?: string | number | boolean;
  /** Renders the field across two columns. */
  wide?: boolean;
};

export type Column = {
  path: string;
  label: string;
  type?: "text" | "currency" | "number" | "date" | "datetime" | "boolean" | "status" | "badge" | "json";
  maxWidth?: number;
};

export type TableConfig = {
  key: string;
  table: string;
  label: string;
  singular: string;
  group: GroupKey;
  primaryKey: string;
  description: string;
  icon: string;
  /** PostgREST select string for list pages. */
  select?: string;
  columns: Column[];
  fields: Field[];
  searchFields?: string[];
  defaultSort?: { column: string; ascending: boolean };
  allowCreate?: boolean;
  allowDelete?: boolean;
  readOnly?: boolean;
};

export type GroupKey = "overview" | "catalog" | "inventory" | "sales" | "customers" | "content";

export const GROUPS: { key: GroupKey; label: string }[] = [
  { key: "catalog", label: "Danh mục & Sản phẩm" },
  { key: "inventory", label: "Kho hàng" },
  { key: "sales", label: "Bán hàng" },
  { key: "customers", label: "Khách hàng" },
  { key: "content", label: "Đánh giá & Thông báo" },
];

const orderStatuses: Option[] = [
  { value: "PENDING", label: "Chờ xác nhận" },
  { value: "CONFIRMED", label: "Đã xác nhận" },
  { value: "PROCESSING", label: "Đang xử lý" },
  { value: "SHIPPED", label: "Đã giao vận" },
  { value: "DELIVERED", label: "Đã giao" },
  { value: "COMPLETED", label: "Hoàn tất" },
  { value: "CANCELLED", label: "Đã hủy" },
];

const paymentStatuses: Option[] = [
  { value: "PENDING", label: "Chờ thanh toán" },
  { value: "PAID", label: "Đã thanh toán" },
  { value: "FAILED", label: "Thất bại" },
  { value: "REFUNDED", label: "Đã hoàn tiền" },
  { value: "CANCELLED", label: "Đã hủy" },
];

const shipmentStatuses: Option[] = [
  { value: "PENDING", label: "Chờ lấy hàng" },
  { value: "PICKED_UP", label: "Đã lấy hàng" },
  { value: "IN_TRANSIT", label: "Đang vận chuyển" },
  { value: "OUT_FOR_DELIVERY", label: "Đang giao" },
  { value: "DELIVERED", label: "Đã giao" },
  { value: "FAILED", label: "Giao thất bại" },
  { value: "RETURNED", label: "Hoàn về" },
];

export const TABLES: TableConfig[] = [
  {
    key: "products",
    table: "products",
    label: "Sản phẩm",
    singular: "sản phẩm",
    group: "catalog",
    primaryKey: "product_id",
    description: "Thông tin gốc của sản phẩm, liên kết thương hiệu và danh mục.",
    icon: "box",
    select:
      "*, brands(brand_name), categories(category_name)",
    columns: [
      { path: "product_name", label: "Tên sản phẩm", maxWidth: 300 },
      { path: "brands.brand_name", label: "Thương hiệu" },
      { path: "categories.category_name", label: "Danh mục" },
      { path: "is_featured", label: "Nổi bật", type: "boolean" },
      { path: "is_active", label: "Hiển thị", type: "boolean" },
      { path: "updated_at", label: "Cập nhật", type: "datetime" },
    ],
    fields: [
      { name: "product_name", label: "Tên sản phẩm", type: "text", required: true, wide: true },
      { name: "slug", label: "Slug", type: "text", required: true, wide: true, help: "Dùng cho URL, nên viết thường và không dấu." },
      {
        name: "brand_id",
        label: "Thương hiệu",
        type: "relation",
        relation: { table: "brands", label: "brand_name", embed: "brands" },
      },
      {
        name: "category_id",
        label: "Danh mục",
        type: "relation",
        relation: { table: "categories", label: "category_name", embed: "categories" },
      },
      { name: "short_description", label: "Mô tả ngắn", type: "textarea", wide: true },
      { name: "description", label: "Mô tả chi tiết", type: "textarea", wide: true },
      { name: "is_active", label: "Đang hiển thị", type: "boolean", defaultValue: true },
      { name: "is_featured", label: "Sản phẩm nổi bật", type: "boolean", defaultValue: false },
    ],
    searchFields: ["product_name", "slug"],
    defaultSort: { column: "updated_at", ascending: false },
  },
  {
    key: "categories",
    table: "categories",
    label: "Danh mục",
    singular: "danh mục",
    group: "catalog",
    primaryKey: "category_id",
    description: "Cây danh mục hiển thị trên thanh điều hướng và trang chủ.",
    icon: "folder",
    select: "*, categories(category_name)",
    columns: [
      { path: "category_name", label: "Tên danh mục", maxWidth: 220 },
      { path: "slug", label: "Slug" },
      { path: "categories.category_name", label: "Danh mục cha" },
      { path: "display_order", label: "Thứ tự", type: "number" },
      { path: "is_active", label: "Hiển thị", type: "boolean" },
    ],
    fields: [
      { name: "category_name", label: "Tên danh mục", type: "text", required: true },
      { name: "slug", label: "Slug", type: "text", required: true },
      {
        name: "parent_category_id",
        label: "Danh mục cha",
        type: "relation",
        relation: { table: "categories", label: "category_name" },
        help: "Để trống nếu là danh mục gốc.",
      },
      { name: "description", label: "Mô tả", type: "textarea", wide: true },
      { name: "image_url", label: "Ảnh danh mục (URL)", type: "text", wide: true },
      { name: "display_order", label: "Thứ tự hiển thị", type: "number", defaultValue: 0 },
      { name: "is_active", label: "Đang hiển thị", type: "boolean", defaultValue: true },
    ],
    searchFields: ["category_name", "slug"],
    defaultSort: { column: "display_order", ascending: true },
  },
  {
    key: "brands",
    table: "brands",
    label: "Thương hiệu",
    singular: "thương hiệu",
    group: "catalog",
    primaryKey: "brand_id",
    description: "Nhà sản xuất / thương hiệu của sản phẩm.",
    icon: "tag",
    columns: [
      { path: "brand_name", label: "Thương hiệu", maxWidth: 220 },
      { path: "description", label: "Mô tả", maxWidth: 360 },
      { path: "is_active", label: "Hiển thị", type: "boolean" },
      { path: "created_at", label: "Ngày tạo", type: "date" },
    ],
    fields: [
      { name: "brand_name", label: "Tên thương hiệu", type: "text", required: true },
      { name: "description", label: "Mô tả", type: "textarea", wide: true },
      { name: "logo_url", label: "Logo (URL)", type: "text", wide: true },
      { name: "is_active", label: "Đang hiển thị", type: "boolean", defaultValue: true },
    ],
    searchFields: ["brand_name"],
    defaultSort: { column: "brand_name", ascending: true },
  },
  {
    key: "product_variants",
    table: "product_variants",
    label: "Phiên bản & Giá",
    singular: "phiên bản",
    group: "catalog",
    primaryKey: "variant_id",
    description: "SKU, giá bán và giá gốc của từng phiên bản sản phẩm.",
    icon: "layers",
    select: "*, products(product_name)",
    columns: [
      { path: "products.product_name", label: "Sản phẩm", maxWidth: 300 },
      { path: "variant_name", label: "Phiên bản" },
      { path: "sku", label: "SKU" },
      { path: "price", label: "Giá bán", type: "currency" },
      { path: "compare_at_price", label: "Giá gốc", type: "currency" },
      { path: "is_active", label: "Hiển thị", type: "boolean" },
    ],
    fields: [
      {
        name: "product_id",
        label: "Sản phẩm",
        type: "relation",
        required: true,
        relation: { table: "products", label: "product_name", embed: "products" },
      },
      { name: "variant_name", label: "Tên phiên bản", type: "text", placeholder: "Tiêu chuẩn" },
      { name: "sku", label: "SKU", type: "text", required: true },
      { name: "price", label: "Giá bán (VND)", type: "number", required: true },
      { name: "compare_at_price", label: "Giá gốc (VND)", type: "number" },
      { name: "is_active", label: "Đang bán", type: "boolean", defaultValue: true },
    ],
    searchFields: ["sku", "variant_name"],
    defaultSort: { column: "sku", ascending: true },
  },
  {
    key: "product_images",
    table: "product_images",
    label: "Hình ảnh sản phẩm",
    singular: "hình ảnh",
    group: "catalog",
    primaryKey: "image_id",
    description: "Thư viện ảnh của sản phẩm.",
    icon: "image",
    select: "*, products(product_name)",
    columns: [
      { path: "products.product_name", label: "Sản phẩm", maxWidth: 320 },
      { path: "image_url", label: "URL ảnh", maxWidth: 360 },
      { path: "alt_text", label: "Alt text" },
      { path: "display_order", label: "Thứ tự", type: "number" },
      { path: "is_primary", label: "Ảnh chính", type: "boolean" },
    ],
    fields: [
      {
        name: "product_id",
        label: "Sản phẩm",
        type: "relation",
        required: true,
        relation: { table: "products", label: "product_name", embed: "products" },
      },
      { name: "image_url", label: "URL ảnh", type: "text", required: true, wide: true },
      { name: "alt_text", label: "Alt text", type: "text", wide: true },
      { name: "display_order", label: "Thứ tự", type: "number", defaultValue: 1 },
      { name: "is_primary", label: "Ảnh chính", type: "boolean", defaultValue: false },
    ],
    searchFields: ["alt_text", "image_url"],
    defaultSort: { column: "display_order", ascending: true },
  },
  {
    key: "product_specifications",
    table: "product_specifications",
    label: "Thông số kỹ thuật",
    singular: "thông số",
    group: "catalog",
    primaryKey: "specification_id",
    description: "Các dòng thông số hiển thị ở trang chi tiết sản phẩm.",
    icon: "list",
    select: "*, products(product_name)",
    columns: [
      { path: "products.product_name", label: "Sản phẩm", maxWidth: 300 },
      { path: "specification_name", label: "Tên thông số" },
      { path: "specification_value", label: "Giá trị", maxWidth: 320 },
      { path: "display_order", label: "Thứ tự", type: "number" },
    ],
    fields: [
      {
        name: "product_id",
        label: "Sản phẩm",
        type: "relation",
        required: true,
        relation: { table: "products", label: "product_name", embed: "products" },
      },
      { name: "specification_name", label: "Tên thông số", type: "text", required: true },
      { name: "specification_value", label: "Giá trị", type: "text", required: true, wide: true },
      { name: "display_order", label: "Thứ tự", type: "number", defaultValue: 1 },
    ],
    searchFields: ["specification_name", "specification_value"],
    defaultSort: { column: "display_order", ascending: true },
  },
  {
    key: "inventory",
    table: "inventory",
    label: "Tồn kho",
    singular: "bản ghi tồn kho",
    group: "inventory",
    primaryKey: "inventory_id",
    description: "Số lượng tồn theo từng kho và từng phiên bản sản phẩm.",
    icon: "warehouse",
    select: "*, warehouses(warehouse_name), product_variants(sku)",
    columns: [
      { path: "product_variants.sku", label: "SKU" },
      { path: "warehouses.warehouse_name", label: "Kho" },
      { path: "quantity_on_hand", label: "Tồn thực tế", type: "number" },
      { path: "quantity_reserved", label: "Đang giữ", type: "number" },
      { path: "updated_at", label: "Cập nhật", type: "datetime" },
    ],
    fields: [
      {
        name: "warehouse_id",
        label: "Kho",
        type: "relation",
        required: true,
        relation: { table: "warehouses", label: "warehouse_name", embed: "warehouses" },
      },
      {
        name: "variant_id",
        label: "Phiên bản sản phẩm",
        type: "relation",
        required: true,
        relation: { table: "product_variants", label: "sku", embed: "product_variants" },
      },
      { name: "quantity_on_hand", label: "Tồn thực tế", type: "number", required: true, defaultValue: 0 },
      { name: "quantity_reserved", label: "Đang giữ", type: "number", required: true, defaultValue: 0 },
    ],
    searchFields: [],
    defaultSort: { column: "quantity_on_hand", ascending: true },
  },
  {
    key: "warehouses",
    table: "warehouses",
    label: "Kho hàng",
    singular: "kho hàng",
    group: "inventory",
    primaryKey: "warehouse_id",
    description: "Danh sách kho và địa chỉ kho.",
    icon: "building",
    columns: [
      { path: "warehouse_name", label: "Tên kho", maxWidth: 260 },
      { path: "address", label: "Địa chỉ", maxWidth: 360 },
      { path: "is_active", label: "Hoạt động", type: "boolean" },
    ],
    fields: [
      { name: "warehouse_name", label: "Tên kho", type: "text", required: true },
      { name: "address", label: "Địa chỉ", type: "textarea", wide: true },
      { name: "is_active", label: "Đang hoạt động", type: "boolean", defaultValue: true },
    ],
    searchFields: ["warehouse_name", "address"],
    defaultSort: { column: "warehouse_name", ascending: true },
  },
  {
    key: "orders",
    table: "orders",
    label: "Đơn hàng",
    singular: "đơn hàng",
    group: "sales",
    primaryKey: "order_id",
    description: "Đơn đặt hàng, trạng thái và tổng tiền.",
    icon: "receipt",
    select: "*, profiles(display_name, phone)",
    columns: [
      { path: "order_code", label: "Mã đơn" },
      { path: "profiles.display_name", label: "Khách hàng", maxWidth: 200 },
      { path: "order_status", label: "Trạng thái", type: "status" },
      { path: "total_amount", label: "Tổng tiền", type: "currency" },
      { path: "placed_at", label: "Đặt lúc", type: "datetime" },
    ],
    fields: [
      { name: "order_code", label: "Mã đơn", type: "text", required: true },
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
      { name: "order_status", label: "Trạng thái", type: "select", options: orderStatuses, defaultValue: "PENDING" },
      { name: "subtotal", label: "Tạm tính", type: "number", required: true, defaultValue: 0 },
      { name: "discount_amount", label: "Giảm giá", type: "number", required: true, defaultValue: 0 },
      { name: "shipping_fee", label: "Phí vận chuyển", type: "number", required: true, defaultValue: 0 },
      { name: "total_amount", label: "Tổng tiền", type: "number", required: true, defaultValue: 0 },
      { name: "customer_note", label: "Ghi chú của khách", type: "textarea", wide: true },
      { name: "placed_at", label: "Thời điểm đặt", type: "datetime", required: true },
    ],
    searchFields: ["order_code"],
    defaultSort: { column: "placed_at", ascending: false },
  },
  {
    key: "user_activity_logs",
    table: "user_activity_logs",
    label: "Hoạt động người dùng",
    singular: "hoạt động",
    group: "customers",
    primaryKey: "activity_id",
    description: "Nhật ký đăng nhập, xem sản phẩm, thao tác giỏ hàng và đặt đơn trên storefront.",
    icon: "list",
    select: "*, profiles(display_name)",
    columns: [
      { path: "profiles.display_name", label: "Khách hàng", maxWidth: 200 },
      { path: "event_type", label: "Hoạt động", type: "badge" },
      { path: "description", label: "Chi tiết", maxWidth: 360 },
      { path: "metadata", label: "Dữ liệu sự kiện", type: "json", maxWidth: 300 },
      { path: "created_at", label: "Thời điểm", type: "datetime" },
    ],
    fields: [
      { name: "user_id", label: "Khách hàng", type: "text", readOnly: true },
      { name: "event_type", label: "Hoạt động", type: "text", readOnly: true },
      { name: "description", label: "Chi tiết", type: "textarea", readOnly: true },
      { name: "metadata", label: "Dữ liệu", type: "textarea", readOnly: true, wide: true },
      { name: "created_at", label: "Thời điểm", type: "datetime", readOnly: true },
    ],
    searchFields: ["event_type", "description"],
    defaultSort: { column: "created_at", ascending: false },
    allowCreate: false,
    allowDelete: false,
    readOnly: true,
  },
  {
    key: "order_items",
    table: "order_items",
    label: "Chi tiết đơn hàng",
    singular: "dòng đơn hàng",
    group: "sales",
    primaryKey: "order_item_id",
    description: "Các sản phẩm nằm trong đơn hàng (lưu ảnh chụp thông tin tại thời điểm mua).",
    icon: "list",
    select: "*, orders(order_code), product_variants(sku)",
    columns: [
      { path: "orders.order_code", label: "Mã đơn" },
      { path: "product_name_snapshot", label: "Sản phẩm", maxWidth: 300 },
      { path: "variant_name_snapshot", label: "Phiên bản" },
      { path: "sku_snapshot", label: "SKU" },
      { path: "quantity", label: "SL", type: "number" },
      { path: "line_total", label: "Thành tiền", type: "currency" },
    ],
    fields: [
      {
        name: "order_id",
        label: "Đơn hàng",
        type: "relation",
        required: true,
        relation: { table: "orders", label: "order_code", embed: "orders" },
      },
      {
        name: "variant_id",
        label: "Phiên bản",
        type: "relation",
        relation: { table: "product_variants", label: "sku", embed: "product_variants" },
      },
      { name: "product_name_snapshot", label: "Tên sản phẩm", type: "text", required: true, wide: true },
      { name: "variant_name_snapshot", label: "Tên phiên bản", type: "text" },
      { name: "sku_snapshot", label: "SKU", type: "text" },
      { name: "unit_price", label: "Đơn giá", type: "number", required: true },
      { name: "quantity", label: "Số lượng", type: "number", required: true, defaultValue: 1 },
      { name: "line_total", label: "Thành tiền", type: "number", required: true, defaultValue: 0 },
    ],
    searchFields: ["product_name_snapshot", "sku_snapshot"],
    defaultSort: { column: "line_total", ascending: false },
  },
  {
    key: "order_addresses",
    table: "order_addresses",
    label: "Địa chỉ giao hàng",
    singular: "địa chỉ giao hàng",
    group: "sales",
    primaryKey: "order_address_id",
    description: "Địa chỉ nhận hàng lưu theo từng đơn.",
    icon: "map",
    select: "*, orders(order_code)",
    columns: [
      { path: "orders.order_code", label: "Mã đơn" },
      { path: "recipient_name", label: "Người nhận" },
      { path: "phone", label: "Điện thoại" },
      { path: "address_line", label: "Địa chỉ", maxWidth: 320 },
      { path: "city", label: "Tỉnh/Thành" },
    ],
    fields: [
      {
        name: "order_id",
        label: "Đơn hàng",
        type: "relation",
        required: true,
        relation: { table: "orders", label: "order_code", embed: "orders" },
      },
      { name: "recipient_name", label: "Người nhận", type: "text", required: true },
      { name: "phone", label: "Điện thoại", type: "text", required: true },
      { name: "address_line", label: "Địa chỉ", type: "text", required: true, wide: true },
      { name: "ward", label: "Phường/Xã", type: "text" },
      { name: "district", label: "Quận/Huyện", type: "text" },
      { name: "city", label: "Tỉnh/Thành phố", type: "text", required: true },
      { name: "country", label: "Quốc gia", type: "text", required: true, defaultValue: "Vietnam" },
    ],
    searchFields: ["recipient_name", "phone", "address_line"],
  },
  {
    key: "payments",
    table: "payments",
    label: "Thanh toán",
    singular: "thanh toán",
    group: "sales",
    primaryKey: "payment_id",
    description: "Giao dịch thanh toán của đơn hàng.",
    icon: "card",
    select: "*, orders(order_code), payment_methods(method_name)",
    columns: [
      { path: "orders.order_code", label: "Mã đơn" },
      { path: "payment_methods.method_name", label: "Phương thức" },
      { path: "amount", label: "Số tiền", type: "currency" },
      { path: "payment_status", label: "Trạng thái", type: "status" },
      { path: "paid_at", label: "Thanh toán lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "order_id",
        label: "Đơn hàng",
        type: "relation",
        required: true,
        relation: { table: "orders", label: "order_code", embed: "orders" },
      },
      {
        name: "payment_method_id",
        label: "Phương thức",
        type: "relation",
        relation: { table: "payment_methods", label: "method_name", embed: "payment_methods" },
      },
      { name: "amount", label: "Số tiền", type: "number", required: true },
      { name: "payment_status", label: "Trạng thái", type: "select", options: paymentStatuses, defaultValue: "PENDING" },
      { name: "provider_transaction_id", label: "Mã giao dịch", type: "text", wide: true },
      { name: "paid_at", label: "Thời điểm thanh toán", type: "datetime" },
    ],
    searchFields: ["provider_transaction_id"],
    defaultSort: { column: "created_at", ascending: false },
  },
  {
    key: "payment_methods",
    table: "payment_methods",
    label: "Phương thức thanh toán",
    singular: "phương thức",
    group: "sales",
    primaryKey: "payment_method_id",
    description: "Các phương thức thanh toán được bật cho cửa hàng.",
    icon: "wallet",
    columns: [
      { path: "method_name", label: "Tên phương thức" },
      { path: "provider", label: "Provider" },
      { path: "is_active", label: "Hoạt động", type: "boolean" },
    ],
    fields: [
      { name: "method_name", label: "Tên phương thức", type: "text", required: true },
      { name: "provider", label: "Provider", type: "text" },
      { name: "is_active", label: "Đang hoạt động", type: "boolean", defaultValue: true },
    ],
    searchFields: ["method_name", "provider"],
  },
  {
    key: "shipments",
    table: "shipments",
    label: "Vận chuyển",
    singular: "vận đơn",
    group: "sales",
    primaryKey: "shipment_id",
    description: "Thông tin giao vận của đơn hàng.",
    icon: "truck",
    select: "*, orders(order_code)",
    columns: [
      { path: "orders.order_code", label: "Mã đơn" },
      { path: "carrier_name", label: "Đơn vị vận chuyển" },
      { path: "tracking_number", label: "Mã vận đơn" },
      { path: "shipping_status", label: "Trạng thái", type: "status" },
      { path: "shipped_at", label: "Gửi lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "order_id",
        label: "Đơn hàng",
        type: "relation",
        required: true,
        relation: { table: "orders", label: "order_code", embed: "orders" },
      },
      { name: "carrier_name", label: "Đơn vị vận chuyển", type: "text" },
      { name: "tracking_number", label: "Mã vận đơn", type: "text" },
      { name: "shipping_status", label: "Trạng thái", type: "select", options: shipmentStatuses, defaultValue: "PENDING" },
      { name: "shipped_at", label: "Thời điểm gửi", type: "datetime" },
      { name: "delivered_at", label: "Thời điểm giao", type: "datetime" },
    ],
    searchFields: ["tracking_number", "carrier_name"],
    defaultSort: { column: "created_at", ascending: false },
  },
  {
    key: "shipment_tracking_events",
    table: "shipment_tracking_events",
    label: "Lịch sử vận chuyển",
    singular: "sự kiện vận chuyển",
    group: "sales",
    primaryKey: "tracking_event_id",
    description: "Các mốc trạng thái của vận đơn.",
    icon: "route",
    select: "*, shipments(tracking_number)",
    columns: [
      { path: "shipments.tracking_number", label: "Mã vận đơn" },
      { path: "event_status", label: "Trạng thái", type: "status" },
      { path: "event_description", label: "Mô tả", maxWidth: 320 },
      { path: "location", label: "Vị trí" },
      { path: "event_at", label: "Thời điểm", type: "datetime" },
    ],
    fields: [
      {
        name: "shipment_id",
        label: "Vận đơn",
        type: "relation",
        required: true,
        relation: { table: "shipments", label: "tracking_number", embed: "shipments" },
      },
      { name: "event_status", label: "Trạng thái", type: "text", required: true },
      { name: "event_description", label: "Mô tả", type: "textarea", wide: true },
      { name: "location", label: "Vị trí", type: "text" },
      { name: "event_at", label: "Thời điểm", type: "datetime", required: true },
    ],
    searchFields: ["event_status", "location"],
    defaultSort: { column: "event_at", ascending: false },
  },
  {
    key: "refunds",
    table: "refunds",
    label: "Hoàn tiền",
    singular: "hoàn tiền",
    group: "sales",
    primaryKey: "refund_id",
    description: "Yêu cầu hoàn tiền gắn với giao dịch thanh toán.",
    icon: "refund",
    select: "*, payments(provider_transaction_id)",
    columns: [
      { path: "payments.provider_transaction_id", label: "Giao dịch" },
      { path: "amount", label: "Số tiền", type: "currency" },
      { path: "refund_status", label: "Trạng thái", type: "status" },
      { path: "created_at", label: "Tạo lúc", type: "datetime" },
      { path: "processed_at", label: "Xử lý lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "payment_id",
        label: "Thanh toán",
        type: "relation",
        required: true,
        relation: { table: "payments", label: "provider_transaction_id", embed: "payments" },
      },
      { name: "amount", label: "Số tiền", type: "number", required: true },
      { name: "refund_reason", label: "Lý do", type: "textarea", wide: true },
      { name: "refund_status", label: "Trạng thái", type: "text", required: true, defaultValue: "PENDING" },
      { name: "processed_at", label: "Xử lý lúc", type: "datetime" },
    ],
    searchFields: ["refund_status", "refund_reason"],
  },
  {
    key: "returns",
    table: "returns",
    label: "Trả hàng",
    singular: "yêu cầu trả hàng",
    group: "sales",
    primaryKey: "return_id",
    description: "Yêu cầu trả hàng của khách.",
    icon: "rotate",
    select: "*, orders(order_code), profiles(display_name)",
    columns: [
      { path: "orders.order_code", label: "Mã đơn" },
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "return_status", label: "Trạng thái", type: "status" },
      { path: "requested_at", label: "Yêu cầu lúc", type: "datetime" },
      { path: "processed_at", label: "Xử lý lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "order_id",
        label: "Đơn hàng",
        type: "relation",
        required: true,
        relation: { table: "orders", label: "order_code", embed: "orders" },
      },
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
      { name: "return_reason", label: "Lý do", type: "textarea", wide: true, required: true },
      { name: "return_status", label: "Trạng thái", type: "text", required: true, defaultValue: "REQUESTED" },
      { name: "requested_at", label: "Yêu cầu lúc", type: "datetime", required: true },
      { name: "processed_at", label: "Xử lý lúc", type: "datetime" },
    ],
    searchFields: ["return_status", "return_reason"],
    defaultSort: { column: "requested_at", ascending: false },
  },
  {
    key: "warranties",
    table: "warranties",
    label: "Bảo hành",
    singular: "bảo hành",
    group: "sales",
    primaryKey: "warranty_id",
    description: "Thời hạn bảo hành theo từng dòng đơn hàng.",
    icon: "shield",
    select: "*, order_items(sku_snapshot), profiles(display_name)",
    columns: [
      { path: "order_items.sku_snapshot", label: "SKU" },
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "warranty_start", label: "Bắt đầu", type: "date" },
      { path: "warranty_end", label: "Kết thúc", type: "date" },
      { path: "warranty_status", label: "Trạng thái", type: "status" },
    ],
    fields: [
      {
        name: "order_item_id",
        label: "Dòng đơn hàng",
        type: "relation",
        required: true,
        relation: { table: "order_items", label: "sku_snapshot", embed: "order_items" },
      },
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
      { name: "warranty_start", label: "Bắt đầu", type: "date", required: true },
      { name: "warranty_end", label: "Kết thúc", type: "date", required: true },
      { name: "warranty_status", label: "Trạng thái", type: "text", required: true, defaultValue: "ACTIVE" },
    ],
    defaultSort: { column: "warranty_end", ascending: false },
  },
  {
    key: "product_reviews",
    table: "product_reviews",
    label: "Đánh giá sản phẩm",
    singular: "đánh giá",
    group: "content",
    primaryKey: "review_id",
    description: "Đánh giá của khách hàng và trạng thái kiểm duyệt.",
    icon: "star",
    select: "*, products(product_name), profiles(display_name), orders(order_code)",
    columns: [
      { path: "products.product_name", label: "Sản phẩm", maxWidth: 280 },
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "rating", label: "Sao", type: "number" },
      { path: "review_title", label: "Tiêu đề", maxWidth: 240 },
      { path: "review_status", label: "Trạng thái", type: "status" },
      { path: "created_at", label: "Tạo lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "product_id",
        label: "Sản phẩm",
        type: "relation",
        required: true,
        relation: { table: "products", label: "product_name", embed: "products" },
      },
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
      {
        name: "order_id",
        label: "Đơn hàng",
        type: "relation",
        relation: { table: "orders", label: "order_code", embed: "orders" },
      },
      { name: "rating", label: "Số sao (1-5)", type: "number", required: true, defaultValue: 5 },
      { name: "review_title", label: "Tiêu đề", type: "text", wide: true },
      { name: "review_content", label: "Nội dung", type: "textarea", wide: true },
      { name: "review_status", label: "Trạng thái", type: "select", options: [
        { value: "PENDING", label: "Chờ duyệt" },
        { value: "PUBLISHED", label: "Đã duyệt" },
        { value: "HIDDEN", label: "Đã ẩn" },
      ], defaultValue: "PENDING" },
    ],
    searchFields: ["review_title", "review_content"],
    defaultSort: { column: "created_at", ascending: false },
  },
  {
    key: "profiles",
    table: "profiles",
    label: "Khách hàng",
    singular: "khách hàng",
    group: "customers",
    primaryKey: "user_id",
    description: "Hồ sơ người dùng gắn với Supabase Auth.",
    icon: "users",
    columns: [
      { path: "display_name", label: "Tên hiển thị", maxWidth: 220 },
      { path: "phone", label: "Điện thoại" },
      { path: "account_type", label: "Loại tài khoản", type: "badge" },
      { path: "account_status", label: "Trạng thái", type: "status" },
      { path: "created_at", label: "Tham gia", type: "date" },
    ],
    fields: [
      { name: "display_name", label: "Tên hiển thị", type: "text", wide: true },
      { name: "phone", label: "Điện thoại", type: "text" },
      { name: "account_type", label: "Loại tài khoản", type: "select", options: [
        { value: "CLIENT", label: "Khách hàng" },
        { value: "ADMIN", label: "Quản trị viên" },
      ], defaultValue: "CLIENT" },
      { name: "account_status", label: "Trạng thái", type: "select", options: [
        { value: "ACTIVE", label: "Hoạt động" },
        { value: "SUSPENDED", label: "Tạm khóa" },
        { value: "DISABLED", label: "Vô hiệu hóa" },
      ], defaultValue: "ACTIVE" },
    ],
    searchFields: ["display_name", "phone"],
    defaultSort: { column: "created_at", ascending: false },
    allowCreate: false,
    allowDelete: false,
  },
  {
    key: "customer_addresses",
    table: "customer_addresses",
    label: "Sổ địa chỉ",
    singular: "địa chỉ khách hàng",
    group: "customers",
    primaryKey: "address_id",
    description: "Địa chỉ giao hàng đã lưu của khách.",
    icon: "map",
    select: "*, profiles(display_name)",
    columns: [
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "recipient_name", label: "Người nhận" },
      { path: "phone", label: "Điện thoại" },
      { path: "address_line", label: "Địa chỉ", maxWidth: 320 },
      { path: "is_default", label: "Mặc định", type: "boolean" },
    ],
    fields: [
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
      { name: "recipient_name", label: "Người nhận", type: "text", required: true },
      { name: "phone", label: "Điện thoại", type: "text", required: true },
      { name: "address_line", label: "Địa chỉ", type: "text", required: true, wide: true },
      { name: "ward", label: "Phường/Xã", type: "text" },
      { name: "district", label: "Quận/Huyện", type: "text" },
      { name: "city", label: "Tỉnh/Thành phố", type: "text", required: true },
      { name: "country", label: "Quốc gia", type: "text", required: true, defaultValue: "Vietnam" },
      { name: "is_default", label: "Địa chỉ mặc định", type: "boolean", defaultValue: false },
    ],
    searchFields: ["recipient_name", "phone", "address_line"],
  },
  {
    key: "notifications",
    table: "notifications",
    label: "Thông báo",
    singular: "thông báo",
    group: "content",
    primaryKey: "notification_id",
    description: "Thông báo gửi tới khách hàng.",
    icon: "bell",
    select: "*, profiles(display_name)",
    columns: [
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "title", label: "Tiêu đề", maxWidth: 240 },
      { path: "notification_type", label: "Loại", type: "badge" },
      { path: "is_read", label: "Đã đọc", type: "boolean" },
      { path: "created_at", label: "Tạo lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
      { name: "title", label: "Tiêu đề", type: "text", required: true, wide: true },
      { name: "message", label: "Nội dung", type: "textarea", required: true, wide: true },
      { name: "notification_type", label: "Loại", type: "select", options: [
        { value: "SYSTEM", label: "Hệ thống" },
        { value: "ORDER", label: "Đơn hàng" },
        { value: "PROMOTION", label: "Khuyến mãi" },
      ], defaultValue: "SYSTEM" },
      { name: "is_read", label: "Đã đọc", type: "boolean", defaultValue: false },
    ],
    searchFields: ["title", "message"],
    defaultSort: { column: "created_at", ascending: false },
  },
  {
    key: "wishlists",
    table: "wishlists",
    label: "Danh sách yêu thích",
    singular: "danh sách yêu thích",
    group: "customers",
    primaryKey: "wishlist_id",
    description: "Danh sách sản phẩm yêu thích của khách.",
    icon: "heart",
    select: "*, profiles(display_name)",
    columns: [
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "created_at", label: "Tạo lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
    ],
    defaultSort: { column: "created_at", ascending: false },
  },
  {
    key: "wishlist_items",
    table: "wishlist_items",
    label: "Sản phẩm yêu thích",
    singular: "sản phẩm yêu thích",
    group: "customers",
    primaryKey: "wishlist_item_id",
    description: "Sản phẩm nằm trong danh sách yêu thích.",
    icon: "heart",
    select: "*, products(product_name), wishlists(profiles(display_name))",
    columns: [
      { path: "wishlists.profiles.display_name", label: "Khách hàng" },
      { path: "products.product_name", label: "Sản phẩm", maxWidth: 320 },
      { path: "created_at", label: "Thêm lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "wishlist_id",
        label: "Danh sách",
        type: "relation",
        required: true,
        relation: { table: "wishlists", label: "wishlist_id", embed: "wishlists" },
      },
      {
        name: "product_id",
        label: "Sản phẩm",
        type: "relation",
        required: true,
        relation: { table: "products", label: "product_name", embed: "products" },
      },
    ],
    defaultSort: { column: "created_at", ascending: false },
  },
  {
    key: "shopping_carts",
    table: "shopping_carts",
    label: "Giỏ hàng",
    singular: "giỏ hàng",
    group: "customers",
    primaryKey: "cart_id",
    description: "Giỏ hàng lưu trên hệ thống của khách.",
    icon: "cart",
    select: "*, profiles(display_name)",
    columns: [
      { path: "profiles.display_name", label: "Khách hàng" },
      { path: "created_at", label: "Tạo lúc", type: "datetime" },
      { path: "updated_at", label: "Cập nhật", type: "datetime" },
    ],
    fields: [
      {
        name: "user_id",
        label: "Khách hàng",
        type: "relation",
        required: true,
        relation: { table: "profiles", label: "display_name", embed: "profiles" },
      },
    ],
    defaultSort: { column: "updated_at", ascending: false },
  },
  {
    key: "cart_items",
    table: "cart_items",
    label: "Sản phẩm trong giỏ",
    singular: "dòng giỏ hàng",
    group: "customers",
    primaryKey: "cart_item_id",
    description: "Các sản phẩm đang nằm trong giỏ hàng.",
    icon: "cart",
    select: "*, shopping_carts(profiles(display_name)), product_variants(sku)",
    columns: [
      { path: "shopping_carts.profiles.display_name", label: "Khách hàng" },
      { path: "product_variants.sku", label: "SKU" },
      { path: "quantity", label: "Số lượng", type: "number" },
      { path: "created_at", label: "Thêm lúc", type: "datetime" },
    ],
    fields: [
      {
        name: "cart_id",
        label: "Giỏ hàng",
        type: "relation",
        required: true,
        relation: { table: "shopping_carts", label: "cart_id", embed: "shopping_carts" },
      },
      {
        name: "variant_id",
        label: "Phiên bản",
        type: "relation",
        required: true,
        relation: { table: "product_variants", label: "sku", embed: "product_variants" },
      },
      { name: "quantity", label: "Số lượng", type: "number", required: true, defaultValue: 1 },
    ],
    defaultSort: { column: "created_at", ascending: false },
  },
];

export const TABLE_MAP = new Map(TABLES.map((config) => [config.key, config]));

export function getTableConfig(key: string) {
  return TABLE_MAP.get(key);
}

export function tableHref(key: string) {
  return `/admin/manage/${key}`;
}
