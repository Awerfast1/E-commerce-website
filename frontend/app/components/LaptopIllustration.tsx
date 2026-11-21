import type { CSSProperties } from "react";

export default function LaptopIllustration({ index }: { index: number }) {
  return (
    <svg viewBox="0 0 220 150" fill="none"
      style={{ "--screen-color": `hsl(${210 + index * 13} 80% 40%)` } as CSSProperties}
      aria-hidden="true">
      <rect x="24" y="15" width="172" height="111" rx="8" fill="#202938" stroke="#46566d" strokeWidth="5" />
      <rect x="32" y="23" width="156" height="95" rx="3" fill="var(--screen-color)" />
      <path d="M32 95 85 45l45 43 35-29 23 25v34H32Z" fill="#ffffff33" />
      <path d="M12 128h196l-12 11H24z" fill="#7d899b" />
      <path d="M71 128h78l5 6H66z" fill="#424c5b" />
    </svg>
  );
}
