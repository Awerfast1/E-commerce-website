import type { SVGProps } from "react";

const icons: Record<string, string[]> = {
  dashboard: ["M3 3h7v9H3zM14 3h7v5h-7zM14 12h7v9h-7zM3 16h7v5H3z"],
  box: ["M21 8l-9-5-9 5 9 5 9-5z", "M3 8v8l9 5 9-5V8", "M12 13v8"],
  folder: ["M3 7a2 2 0 0 1 2-2h4l2 2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"],
  tag: ["M20 13l-7 7-9-9V4h7z", "M8 8h.01"],
  layers: ["M12 3l9 5-9 5-9-5z", "M3 13l9 5 9-5", "M3 17l9 5 9-5"],
  image: ["M3 5h18v14H3z", "M3 15l5-5 4 4 3-3 6 6", "M8 10h.01"],
  list: ["M8 6h13M8 12h13M8 18h13", "M3 6h.01M3 12h.01M3 18h.01"],
  warehouse: ["M3 21V9l9-6 9 6v12", "M7 21v-8h10v8", "M7 17h10"],
  building: ["M4 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16", "M16 9h3a1 1 0 0 1 1 1v11", "M8 7h4M8 11h4M8 15h4M8 19h4"],
  receipt: ["M6 3h12v18l-3-2-3 2-3-2-3 2z", "M9 8h6M9 12h6M9 16h4"],
  card: ["M3 6h18v12H3z", "M3 10h18", "M7 15h3"],
  wallet: ["M3 7h15a3 3 0 0 1 3 3v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z", "M3 7V5a2 2 0 0 1 2-2h11", "M17 13h.01"],
  truck: ["M3 6h11v10H3z", "M14 9h4l3 3v4h-7z", "M7 19a2 2 0 1 0 0-4 2 2 0 0 0 0 4zM17 19a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"],
  route: ["M6 19a3 3 0 1 0 0-6 3 3 0 0 0 0 6zM18 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6z", "M9 16h4a3 3 0 0 0 3-3V9"],
  refund: ["M3 12a9 9 0 1 0 3-6.7", "M3 4v5h5", "M9 12h6"],
  rotate: ["M3 12a9 9 0 1 0 9-9 9 9 0 0 0-6.4 2.6", "M3 3v5h5"],
  shield: ["M12 3l8 3v6c0 5-3.5 8-8 9-4.5-1-8-4-8-9V6z", "M9 12l2 2 4-4"],
  star: ["M12 3l2.8 5.7 6.2.9-4.5 4.4 1.1 6.2-5.6-3-5.6 3 1.1-6.2L3 9.6l6.2-.9z"],
  users: ["M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2", "M9 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8z", "M22 21v-2a4 4 0 0 0-3-3.9", "M16 3.1a4 4 0 0 1 0 7.8"],
  map: ["M9 18l-6 3V6l6-3 6 3 6-3v15l-6 3z", "M9 3v15M15 6v15"],
  bell: ["M18 8a6 6 0 1 0-12 0c0 7-3 9-3 9h18s-3-2-3-9", "M10 21h4"],
  heart: ["M20.8 5.6a5.5 5.5 0 0 0-7.8 0L12 6.6l-1-1a5.5 5.5 0 0 0-7.8 7.8l8.8 8.8 8.8-8.8a5.5 5.5 0 0 0 0-7.8z"],
  cart: ["M3 3h2l2 12h11l2-8H6", "M9 21a1 1 0 1 0 0-2 1 1 0 0 0 0 2zM18 21a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"],
  logout: ["M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4", "M16 17l5-5-5-5", "M21 12H9"],
  external: ["M14 3h7v7", "M10 14L21 3", "M21 14v7h-7", "M3 10V3h7"],
  menu: ["M3 6h18M3 12h18M3 18h18"],
  close: ["M6 6l12 12M18 6L6 18"],
  search: ["M21 21l-5-5", "M11 18a7 7 0 1 0 0-14 7 7 0 0 0 0 14z"],
  plus: ["M12 5v14M5 12h14"],
  arrow: ["M5 12h14M13 6l6 6-6 6"],
  calendar: ["M3 5h18v16H3z", "M16 3v4M8 3v4M3 11h18"],
  trend: ["M3 17l6-6 4 4 8-8", "M15 7h6v6"],
};

export default function AdminIcon({
  name,
  className = "h-5 w-5",
  ...props
}: { name: string } & SVGProps<SVGSVGElement>) {
  const paths = icons[name] || icons.box;
  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={1.8}
      strokeLinecap="round"
      strokeLinejoin="round"
      className={className}
      aria-hidden="true"
      {...props}
    >
      {paths.map((d, index) => (
        <path key={index} d={d} />
      ))}
    </svg>
  );
}
