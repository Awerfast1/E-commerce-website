import type { ReactNode } from "react";
import { connection } from "next/server";

import Footer from "../components/Footer";
import NavBar from "../components/NavBar";
import { CatalogProvider } from "../components/cart";
import { getStoreProducts } from "@/lib/store/catalog";

// The storefront shell reads the live catalog, so its routes block on the server
// instead of being prerendered into an instant static shell.
export const instant = false;

export default async function StorefrontLayout({ children }: { children: ReactNode }) {
  // The catalog comes from the database, so the storefront must render per request
  // to reflect edits made in the admin panel (cacheComponents is enabled in next.config.ts).
  await connection();

  const products = await getStoreProducts();

  return (
    <CatalogProvider products={products}>
      <NavBar products={products} />
      {children}
      <Footer />
    </CatalogProvider>
  );
}
