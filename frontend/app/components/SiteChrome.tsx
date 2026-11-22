"use client";

import { Suspense, type ReactNode } from "react";
import { usePathname } from "next/navigation";
import NavBar from "./NavBar";
import Footer from "./Footer";

function SiteChromeContent({ children }: { children: ReactNode }) {
  const pathname = usePathname();
  const isAuthPage = pathname === "/dang-nhap" || pathname === "/dang-ky" || pathname === "/auth/callback" || pathname === "/dat-lai-mat-khau";

  return (
    <>
      {!isAuthPage && <NavBar />}
      {children}
      {!isAuthPage && <Footer />}
    </>
  );
}

export default function SiteChrome({ children }: { children: ReactNode }) {
  return (
    <Suspense fallback={<><NavBar />{children}<Footer /></>}>
      <SiteChromeContent>{children}</SiteChromeContent>
    </Suspense>
  );
}
