import { notFound } from "next/navigation";

import { saveRecord } from "../../../../actions";
import { getTableConfig } from "@/lib/admin/config";
import { loadRelationOptions } from "@/lib/admin/relations";
import RecordForm from "../RecordForm";

export const instant = false;

export default async function NewRecordPage({ params }: { params: Promise<{ table: string }> }) {
  const { table } = await params;
  const config = getTableConfig(table);
  if (!config) notFound();
  if (config.allowCreate === false) notFound();

  const optionMap = await loadRelationOptions(config);

  return (
    <RecordForm
      config={config}
      row={null}
      optionMap={optionMap}
      action={saveRecord.bind(null, config.key, null)}
    />
  );
}
