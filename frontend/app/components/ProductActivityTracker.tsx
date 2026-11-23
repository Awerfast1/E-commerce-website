"use client";

import { useEffect, useRef } from "react";

export default function ProductActivityTracker({ slug }: { slug: string }) {
  const tracked = useRef("");

  useEffect(() => {
    if (!slug || tracked.current === slug) return;
    tracked.current = slug;
    void fetch("/api/activity", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ eventType: "product_viewed", slug }),
      keepalive: true,
    }).catch(() => undefined);
  }, [slug]);

  return null;
}
