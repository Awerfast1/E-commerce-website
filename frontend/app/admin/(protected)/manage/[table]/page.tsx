import Link from "next/link";
import { notFound } from "next/navigation";

import AdminIcon from "../../../AdminIcon";
import DeleteButton from "../../../DeleteButton";
import { deleteRecord } from "../../../actions";
import { getTableConfig, tableHref, type Column } from "@/lib/admin/config";
import { formatBoolean, formatCurrency, formatDate, formatNumber, statusTone, truncate } from "@/lib/admin/format";
import { getAdminDb } from "@/lib/admin/supabaseAdmin";

export const instant = false;

const PAGE_SIZE = 20;

type SearchParams = {
  q?: string;
  page?: string;
  sort?: string;
  dir?: string;
  ok?: string;
  error?: string;
};

function readPath(row: unknown, path: string): unknown {
  let value = row as unknown;
  for (const key of path.split(".")) {
    if (Array.isArray(value)) value = value[0];
    if (value == null || typeof value !== "object") return undefined;
    value = (value as Record<string, unknown>)[key];
  }
  if (Array.isArray(value)) value = value[0];
  return value;
}

function renderCell(value: unknown, column: Column) {
  if (value == null || value === "") return <span className="text-slate-300">—</span>;

  switch (column.type) {
    case "currency":
      return <span className="whitespace-nowrap font-medium text-slate-800">{formatCurrency(value)}</span>;
    case "number":
      return <span className="tabular-nums text-slate-700">{formatNumber(value)}</span>;
    case "boolean":
      return (
        <span
          className={`inline-flex rounded-full px-2 py-0.5 text-[11px] font-semibold ring-1 ring-inset ${
            value ? "bg-emerald-50 text-emerald-700 ring-emerald-200" : "bg-slate-100 text-slate-500 ring-slate-200"
          }`}
        >
          {formatBoolean(value)}
        </span>
      );
    case "date":
      return <span className="whitespace-nowrap text-slate-600">{formatDate(value)}</span>;
    case "datetime":
      return <span className="whitespace-nowrap text-slate-600">{formatDate(value, true)}</span>;
    case "status":
      return (
        <span className={`inline-flex rounded-full px-2.5 py-1 text-[11px] font-semibold ring-1 ring-inset ${statusTone(value)}`}>
          {String(value)}
        </span>
      );
    case "badge":
      return (
        <span className="inline-flex rounded-full bg-slate-100 px-2.5 py-1 text-[11px] font-semibold text-slate-700">
          {String(value)}
        </span>
      );
    default: {
      const text = String(value);
      return (
        <span title={text} className="text-slate-700">
          {column.maxWidth ? truncate(text, Math.floor(column.maxWidth / 7)) : text}
        </span>
      );
    }
  }
}

function pageHref(tableKey: string, params: SearchParams, page: number) {
  const query = new URLSearchParams();
  if (params.q) query.set("q", params.q);
  if (params.sort) query.set("sort", params.sort);
  if (params.dir) query.set("dir", params.dir);
  query.set("page", String(page));
  return `${tableHref(tableKey)}?${query.toString()}`;
}

export default async function TableListPage({
  params,
  searchParams,
}: {
  params: Promise<{ table: string }>;
  searchParams: Promise<SearchParams>;
}) {
  const { table } = await params;
  const query = await searchParams;
  const config = getTableConfig(table);
  if (!config) notFound();

  const page = Math.max(1, Number(query.page || 1));
  const from = (page - 1) * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;

  const db = getAdminDb();
  let request = db.from(config.table).select(config.select ?? "*", { count: "exact" });

  const search = (query.q || "").trim();
  if (search && config.searchFields?.length) {
    const safe = search.replace(/[(),%]/g, " ").trim();
    if (safe) {
      request = request.or(config.searchFields.map((field) => `${field}.ilike.%${safe}%`).join(","));
    }
  }

  const directFields = new Set(
    config.fields.filter((field) => !field.name.includes(".")).map((field) => field.name),
  );
  const sort = query.sort && directFields.has(query.sort) ? query.sort : config.defaultSort?.column;
  const ascending = query.dir ? query.dir === "asc" : (config.defaultSort?.ascending ?? true);
  if (sort) request = request.order(sort, { ascending });

  const { data, count, error } = await request.range(from, to);

  if (error) {
    return (
      <div className="space-y-4">
        <h1 className="text-2xl font-bold text-slate-900">{config.label}</h1>
        <p className="rounded-2xl border border-rose-200 bg-rose-50 p-5 text-sm text-rose-700">
          Không tải được dữ liệu: {error.message}
        </p>
      </div>
    );
  }

  const rows = (data ?? []) as unknown as Record<string, unknown>[];
  const total = count ?? 0;
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE));

  return (
    <div className="space-y-5">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <div className="flex items-center gap-2">
            <span className="grid h-9 w-9 place-items-center rounded-xl bg-slate-900 text-white">
              <AdminIcon name={config.icon} className="h-4 w-4" />
            </span>
            <h1 className="text-2xl font-bold tracking-tight text-slate-900">{config.label}</h1>
          </div>
          <p className="mt-1.5 max-w-2xl text-sm text-slate-500">{config.description}</p>
        </div>
        {config.allowCreate !== false && (
          <Link
            href={`${tableHref(config.key)}/new`}
            className="inline-flex items-center gap-2 rounded-xl bg-slate-950 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800"
          >
            <AdminIcon name="plus" className="h-4 w-4" />
            Thêm {config.singular}
          </Link>
        )}
      </div>

      {query.ok && (
        <p className="rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-700">
          {query.ok}
        </p>
      )}
      {query.error && (
        <p className="rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-700">{query.error}</p>
      )}

      <div className="rounded-2xl border border-slate-200 bg-white shadow-sm">
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-100 px-4 py-3.5">
          <form action={tableHref(config.key)} className="flex items-center gap-2">
            <div className="relative">
              <AdminIcon name="search" className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />
              <input
                type="search"
                name="q"
                defaultValue={search}
                placeholder={`Tìm ${config.singular}…`}
                className="h-9 w-56 rounded-lg border border-slate-200 pl-9 pr-3 text-sm outline-none transition focus:border-emerald-500 focus:ring-4 focus:ring-emerald-500/10 sm:w-72"
              />
            </div>
            <button type="submit" className="h-9 rounded-lg bg-slate-900 px-3 text-xs font-semibold text-white hover:bg-slate-800">
              Tìm
            </button>
            {search && (
              <Link href={tableHref(config.key)} className="text-xs font-medium text-slate-500 hover:text-slate-900">
                Xóa lọc
              </Link>
            )}
          </form>
          <p className="text-xs text-slate-500">
            <span className="font-semibold text-slate-800">{formatNumber(total)}</span> bản ghi
          </p>
        </div>

        {rows.length === 0 ? (
          <div className="p-10 text-center">
            <p className="text-sm font-medium text-slate-700">Chưa có dữ liệu</p>
            <p className="mt-1 text-xs text-slate-500">
              {search ? "Không tìm thấy kết quả phù hợp." : `Bảng ${config.table} đang trống.`}
            </p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full min-w-[720px] text-left text-sm">
              <thead className="bg-slate-50 text-[11px] uppercase tracking-wider text-slate-500">
                <tr>
                  {config.columns.map((column) => {
                    const sortable = !column.path.includes(".");
                    const isCurrent = query.sort === column.path;
                    return (
                      <th key={column.path} className="whitespace-nowrap px-4 py-3 font-semibold">
                        {sortable ? (
                          <Link
                            href={`${tableHref(config.key)}?${new URLSearchParams({
                              ...(search ? { q: search } : {}),
                              sort: column.path,
                              dir: isCurrent && ascending ? "desc" : "asc",
                            }).toString()}`}
                            className="inline-flex items-center gap-1 hover:text-slate-900"
                          >
                            {column.label}
                            {isCurrent && <span className="text-[10px]">{ascending ? "▲" : "▼"}</span>}
                          </Link>
                        ) : (
                          column.label
                        )}
                      </th>
                    );
                  })}
                  <th className="w-28 px-4 py-3 text-right font-semibold">Thao tác</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {rows.map((row) => {
                  const id = String(row[config.primaryKey] ?? "");
                  return (
                    <tr key={id} className="transition hover:bg-slate-50/70">
                      {config.columns.map((column) => (
                        <td key={column.path} className="px-4 py-3 align-top">
                          {renderCell(readPath(row, column.path), column)}
                        </td>
                      ))}
                      <td className="px-4 py-3 align-top">
                        <div className="flex items-center justify-end gap-2">
                          <Link
                            href={`${tableHref(config.key)}/${id}`}
                            className="rounded-lg border border-slate-200 px-2.5 py-1.5 text-xs font-semibold text-slate-600 transition hover:bg-slate-100"
                          >
                            Sửa
                          </Link>
                          {config.allowDelete !== false && (
                            <DeleteButton action={deleteRecord.bind(null, config.key, id)} />
                          )}
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}

        {totalPages > 1 && (
          <div className="flex flex-wrap items-center justify-between gap-3 border-t border-slate-100 px-4 py-3">
            <p className="text-xs text-slate-500">
              Trang {page}/{totalPages} · hiển thị {from + 1}–{Math.min(to + 1, total)} / {total}
            </p>
            <div className="flex items-center gap-1.5">
              {page > 1 && (
                <Link
                  href={pageHref(config.key, query, page - 1)}
                  className="rounded-lg border border-slate-200 px-3 py-1.5 text-xs font-semibold text-slate-600 hover:bg-slate-100"
                >
                  ← Trước
                </Link>
              )}
              {Array.from({ length: Math.min(5, totalPages) }, (_, index) => {
                const start = Math.max(1, Math.min(page - 2, totalPages - 4));
                return start + index;
              })
                .filter((target) => target >= 1 && target <= totalPages)
                .map((target) => (
                  <Link
                    key={target}
                    href={pageHref(config.key, query, target)}
                    className={`rounded-lg px-3 py-1.5 text-xs font-semibold ${
                      target === page
                        ? "bg-slate-900 text-white"
                        : "border border-slate-200 text-slate-600 hover:bg-slate-100"
                    }`}
                  >
                    {target}
                  </Link>
                ))}
              {page < totalPages && (
                <Link
                  href={pageHref(config.key, query, page + 1)}
                  className="rounded-lg border border-slate-200 px-3 py-1.5 text-xs font-semibold text-slate-600 hover:bg-slate-100"
                >
                  Sau →
                </Link>
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
