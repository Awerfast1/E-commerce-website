
import { Suspense } from "react";
import SearchContent from "./SearchContent";

export default function SearchPage() {
  return (
    <Suspense
      fallback={
        <main className="min-h-screen bg-gray-50 py-8">
          <div className="mx-auto max-w-[1500px] px-4 md:px-8">
            <p className="text-sm text-gray-500">
              Loading products...
            </p>
          </div>
        </main>
      }
    >
      <SearchContent />
    </Suspense>
  );
}
