
import { getSupabase } from "../../lib/supabase";

type Brand = {
  brand_name: string;
  logo_url: string | null;
};

export default async function AdminPage() {
  let brands: Brand[] = [];
  let errorMessage = "";

  try {
    const supabase = getSupabase();

    const { data, error } = await supabase
      .from("brands")
      .select("brand_name, logo_url")
      .order("brand_name", { ascending: true });

    if (error) {
      throw error;
    }

    brands = data ?? [];
  } catch (error) {
    errorMessage =
      error instanceof Error
        ? error.message
        : "Something went wrong.";
  }

  return (
    <main className="min-h-screen bg-gray-50 p-6 md:p-10">
      <div className="mx-auto max-w-6xl">

        {/* Header */}
        <div className="mb-8">
          <p className="text-sm font-medium text-blue-600">
            ADMINISTRATION
          </p>

          <h1 className="mt-2 text-3xl font-bold text-gray-900">
            Brand Management
          </h1>

          <p className="mt-2 text-gray-500">
            View brands stored in your Supabase database.
          </p>
        </div>

        {/* Statistics */}
        <div className="mb-6 rounded-xl border bg-white p-6 shadow-sm">
          <p className="text-sm text-gray-500">
            Total Brands
          </p>

          <p className="mt-2 text-3xl font-bold text-gray-900">
            {brands.length}
          </p>
        </div>

        {/* Brand Table */}
        <div className="overflow-hidden rounded-xl border bg-white shadow-sm">

          <div className="border-b px-6 py-5">
            <h2 className="text-lg font-semibold text-gray-900">
              Brands
            </h2>
          </div>

          {errorMessage ? (
            <div className="p-6 text-red-600">
              <p className="font-semibold">
                Failed to load brands
              </p>
              <p className="mt-2 text-sm">
                {errorMessage}
              </p>
            </div>
          ) : brands.length === 0 ? (
            <div className="p-10 text-center text-gray-500">
              No brands found.
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">

                <thead className="bg-gray-50 text-gray-600">
                  <tr>
                    <th className="px-6 py-4 font-semibold">
                      Logo
                    </th>
                    <th className="px-6 py-4 font-semibold">
                      Brand Name
                    </th>
                    <th className="px-6 py-4 font-semibold">
                      Logo URL
                    </th>
                  </tr>
                </thead>

                <tbody className="divide-y divide-gray-100">
                  {brands.map((brand, index) => (
                    <tr
                      key={`${brand.brand_name}-${index}`}
                      className="hover:bg-gray-50"
                    >
                      <td className="px-6 py-4">
                        {brand.logo_url ? (
                          <img
                            src={brand.logo_url}
                            alt={brand.brand_name}
                            className="h-12 w-20 rounded-md object-contain"
                          />
                        ) : (
                          <div className="flex h-12 w-20 items-center justify-center rounded-md bg-gray-100 text-xs text-gray-400">
                            No Logo
                          </div>
                        )}
                      </td>

                      <td className="px-6 py-4 font-medium text-gray-900">
                        {brand.brand_name}
                      </td>

                      <td className="max-w-xs truncate px-6 py-4 text-gray-500">
                        {brand.logo_url || "Not provided"}
                      </td>
                    </tr>
                  ))}
                </tbody>

              </table>
            </div>
          )}
        </div>

        <p className="mt-4 text-xs text-gray-400">
          Data retrieved directly from Supabase.
        </p>

      </div>
    </main>
  );
}
