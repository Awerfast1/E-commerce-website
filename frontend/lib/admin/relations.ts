import "server-only";

import { TABLES, type TableConfig } from "./config";
import { getAdminDb } from "./supabaseAdmin";

export type RelationOptions = Record<string, { value: string; label: string }[]>;

function primaryKeyFor(table: string) {
  return TABLES.find((config) => config.table === table)?.primaryKey ?? "id";
}

export async function loadRelationOptions(config: TableConfig): Promise<RelationOptions> {
  const db = getAdminDb();
  const result: RelationOptions = {};

  const relationFields = config.fields.filter(
    (field) => field.type === "relation" && field.relation,
  );

  await Promise.all(
    relationFields.map(async (field) => {
      const relation = field.relation!;
      const valueColumn = relation.value ?? primaryKeyFor(relation.table);
      const labelColumn = relation.label;

      let query = db
        .from(relation.table)
        .select(`${valueColumn}, ${labelColumn}`)
        .limit(1000);

      if (labelColumn !== valueColumn) {
        query = query.order(labelColumn, { ascending: true, nullsFirst: false });
      }

      const { data, error } = await query;

      if (error) {
        result[field.name] = [];
        return;
      }

      result[field.name] = ((data ?? []) as unknown as Record<string, unknown>[]).map((record) => {
        const value = String(record[valueColumn] ?? "");
        const label = record[labelColumn];
        return {
          value,
          label: label ? String(label) : `${value.slice(0, 8)}…`,
        };
      });
    }),
  );

  return result;
}
