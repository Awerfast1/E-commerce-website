
import Link from "next/link";

type SectionTitleProps = {
  eyebrow: string;
  title: string;
  action?: string;
  href?: string;
};

export default function SectionTitle({
  eyebrow,
  title,
  action,
  href = "/Search",
}: SectionTitleProps) {
  return (
    <div className="mb-6 flex items-end justify-between gap-4">
      <div>
        <p className="mb-1 text-sm font-semibold uppercase tracking-wider text-[#45A0F0]">
          {eyebrow}
        </p>

        <h2 className="text-2xl font-bold text-gray-900 md:text-3xl">
          {title}
        </h2>
      </div>

      {action && (
        <Link
          href={href}
          className="shrink-0 text-sm font-semibold text-[#2585D5] transition hover:text-blue-800"
        >
          {action} →
        </Link>
      )}
    </div>
  );
}
