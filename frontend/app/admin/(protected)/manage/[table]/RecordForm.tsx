import Link from "next/link";

import AdminIcon from "../../../AdminIcon";
import DeleteButton from "../../../DeleteButton";
import { deleteRecord } from "../../../actions";
import type { TableConfig } from "@/lib/admin/config";
import { formatDate, formatDateTimeInput, formatDateInput } from "@/lib/admin/format";

type OptionMap = Record<string, { value: string; label: string }[]>;

const inputClass =
  "w-full rounded-xl border border-slate-300 bg-white px-3.5 py-2.5 text-sm text-slate-900 outline-none transition placeholder:text-slate-400 focus:border-emerald-500 focus:ring-4 focus:ring-emerald-500/10";

export default function RecordForm({
  config,
  row,
  optionMap,
  action,
  error,
}: {
  config: TableConfig;
  row: Record<string, unknown> | null;
  optionMap: OptionMap;
  action: (formData: FormData) => void | Promise<void>;
  error?: string;
}) {
  const id = row ? String(row[config.primaryKey] ?? "") : null;
  const visibleFields = config.fields.filter((field) => !field.hideInForm && !field.readOnly);

  return (
    <div className="mx-auto max-w-5xl space-y-5">
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div>
          <Link
            href={`/admin/manage/${config.key}`}
            className="inline-flex items-center gap-1.5 text-xs font-semibold text-slate-500 hover:text-slate-900"
          >
            ← {config.label}
          </Link>
          <h1 className="mt-2 text-2xl font-bold tracking-tight text-slate-900">
            {id ? `Chỉnh sửa ${config.singular}` : `Thêm ${config.singular}`}
          </h1>
          <p className="mt-1 text-sm text-slate-500">{config.description}</p>
        </div>
        {id && (
          <span className="rounded-lg bg-slate-100 px-3 py-1.5 font-mono text-[11px] text-slate-500">
            {config.primaryKey}: {id}
          </span>
        )}
      </div>

      {error && (
        <p className="rounded-xl border border-rose-200 bg-rose-50 px-4 py-3 text-sm text-rose-700">{error}</p>
      )}

      <form action={action} className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm sm:p-7">
        <div className="grid gap-5 sm:grid-cols-2">
          {visibleFields.map((field) => {
            const raw = row?.[field.name];
            const value = raw ?? field.defaultValue ?? "";

            return (
              <div key={field.name} className={field.wide ? "sm:col-span-2" : undefined}>
                <label htmlFor={`f_${field.name}`} className="mb-1.5 block text-sm font-medium text-slate-700">
                  {field.label}
                  {field.required && <span className="ml-1 text-rose-500">*</span>}
                </label>

                {field.type === "textarea" ? (
                  <textarea
                    id={`f_${field.name}`}
                    name={`f_${field.name}`}
                    rows={3}
                    required={field.required}
                    placeholder={field.placeholder}
                    defaultValue={String(value)}
                    className={inputClass}
                  />
                ) : field.type === "boolean" ? (
                  <label className="flex cursor-pointer items-center gap-3 rounded-xl border border-slate-200 px-3.5 py-3">
                    <input
                      id={`f_${field.name}`}
                      name={`f_${field.name}`}
                      type="checkbox"
                      defaultChecked={Boolean(value)}
                      className="h-4 w-4 rounded border-slate-300 text-emerald-600 focus:ring-emerald-500"
                    />
                    <span className="text-sm text-slate-600">Bật / có</span>
                  </label>
                ) : field.type === "select" ? (
                  <select
                    id={`f_${field.name}`}
                    name={`f_${field.name}`}
                    required={field.required}
                    defaultValue={String(value)}
                    className={inputClass}
                  >
                    {!field.required && <option value="">— Không chọn —</option>}
                    {(field.options ?? []).map((option) => (
                      <option key={option.value} value={option.value}>
                        {option.label}
                      </option>
                    ))}
                  </select>
                ) : field.type === "relation" ? (
                  <select
                    id={`f_${field.name}`}
                    name={`f_${field.name}`}
                    required={field.required}
                    defaultValue={String(value)}
                    className={inputClass}
                  >
                    {!field.required && <option value="">— Không chọn —</option>}
                    {(optionMap[field.name] ?? []).map((option) => (
                      <option key={option.value} value={option.value}>
                        {option.label}
                      </option>
                    ))}
                  </select>
                ) : field.type === "datetime" ? (
                  <input
                    id={`f_${field.name}`}
                    name={`f_${field.name}`}
                    type="datetime-local"
                    required={field.required}
                    defaultValue={formatDateTimeInput(value)}
                    className={inputClass}
                  />
                ) : field.type === "date" ? (
                  <input
                    id={`f_${field.name}`}
                    name={`f_${field.name}`}
                    type="date"
                    required={field.required}
                    defaultValue={formatDateInput(value)}
                    className={inputClass}
                  />
                ) : (
                  <input
                    id={`f_${field.name}`}
                    name={`f_${field.name}`}
                    type={field.type === "email" ? "email" : field.type === "number" ? "number" : "text"}
                    step={field.type === "number" ? "any" : undefined}
                    required={field.required}
                    placeholder={field.placeholder}
                    defaultValue={String(value)}
                    className={inputClass}
                  />
                )}

                {field.help && <p className="mt-1.5 text-xs text-slate-500">{field.help}</p>}
              </div>
            );
          })}
        </div>

        {row?.created_at != null && (
          <p className="mt-5 border-t border-slate-100 pt-4 text-xs text-slate-400">
            Tạo lúc {formatDate(row.created_at, true)}
            {row.updated_at != null ? ` · Cập nhật ${formatDate(row.updated_at, true)}` : ""}
          </p>
        )}

        <div className="mt-6 flex flex-wrap items-center justify-between gap-3 border-t border-slate-100 pt-5">
          <div className="flex items-center gap-2">
            <button
              type="submit"
              className="inline-flex items-center gap-2 rounded-xl bg-slate-950 px-5 py-2.5 text-sm font-semibold text-white transition hover:bg-slate-800"
            >
              <AdminIcon name="arrow" className="h-4 w-4" />
              {id ? "Lưu thay đổi" : `Tạo ${config.singular}`}
            </button>
            <Link
              href={`/admin/manage/${config.key}`}
              className="rounded-xl border border-slate-200 px-4 py-2.5 text-sm font-semibold text-slate-600 transition hover:bg-slate-50"
            >
              Hủy
            </Link>
          </div>

          {id && config.allowDelete !== false && (
            <DeleteButton action={deleteRecord.bind(null, config.key, id)} label="Xóa bản ghi" />
          )}
        </div>
      </form>
    </div>
  );
}
