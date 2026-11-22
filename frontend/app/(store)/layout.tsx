import type { ReactNode } from "react";

import Footer from "../components/Footer";
import NavBar from "../components/NavBar";

export default function StorefrontLayout({ children }: { children: ReactNode }) {
  return (
    <>
      <NavBar />
      {children}
      <Footer />
    </>
  );
}
