import { notFound } from "next/navigation";

import { saveRecord } from "../../../../actions";
import { getTableConfig } from "@/lib/admin/config";
import { getAdminDb } from "@/lib/admin/supabaseAdmin";
import { loadRelationOptions } from "@/lib/admin/relations";
import RecordForm from "../RecordForm";

export const instant = false;

export default async function EditRecordPage({
  params,
  searchParams,
}: {
  params: Promise<{ table: string; id: string }>;
  searchParams: Promise<{ error?: string }>;
}) {
  const { table, id } = await params;
  const query = await searchParams;
  const config = getTableConfig(table);
  if (!config) notFound();

  const { data, error } = await getAdminDb()
    .from(config.table)
    .select(config.select ?? "*")
    .eq(config.primaryKey, id)
    .maybeSingle();

  if (error || !data) notFound();

  const optionMap = await loadRelationOptions(config);

  return (
    <RecordForm
      config={config}
      row={data as unknown as Record<string, unknown>}
      optionMap={optionMap}
      action={saveRecord.bind(null, config.key, id)}
      error={query.error}
    />
  );
}
