import Link from "next/link";
import { quickCategories } from "../../data/quickCategories";
import styles from "./QuickCategories.module.css";

function CategoryIcon({ icon }: { icon: string }) {
  const shapes: Record<string, React.ReactNode> = {
    laptop: (
      <>
        <rect x="10" y="13" width="44" height="31" rx="3" />
        <path d="M5 50h54l-4-6H9z" />
      </>
    ),
    keyboards: (
      <>
        <rect x="5" y="20" width="54" height="28" rx="3" />
        <path d="M12 27h4m5 0h4m5 0h4m5 0h4m5 0h4M12 34h4m5 0h4m5 0h4m5 0h4m5 0h4M17 41h30" />
      </>
    ),
    mice: (
      <>
        <rect x="18" y="10" width="28" height="44" rx="14" />
        <line x1="32" y1="10" x2="32" y2="28" />
        <line x1="18" y1="26" x2="46" y2="26" />
      </>
    ),
    headphones: (
      <>
        <path d="M14 36v-8a18 18 0 0 1 36 0v8" />
        <rect x="10" y="34" width="8" height="18" rx="4" />
        <rect x="46" y="34" width="8" height="18" rx="4" />
      </>
    ),
    speakers: (
      <>
        <rect x="16" y="8" width="32" height="48" rx="5" />
        <circle cx="32" cy="22" r="5" />
        <circle cx="32" cy="40" r="9" />
        <circle cx="32" cy="40" r="3" />
      </>
    ),
    storage: (
      <>
        <rect x="8" y="17" width="48" height="30" rx="4" />
        <path d="M16 25h32M16 33h20m8 7h4" />
        <circle cx="44" cy="40" r="1.5" />
      </>
    ),
    chargers: (
      <>
        <rect x="14" y="20" width="36" height="34" rx="6" />
        <path d="M24 10v10m16-10v10" />
        <path d="M32 30l-4 8h8l-4 8" />
      </>
    ),
    cables: (
      <>
        <path d="M10 44c12-6 16-24 28-24s10 12 16 12" />
        <rect x="6" y="42" width="8" height="12" rx="2" />
        <rect x="50" y="26" width="8" height="12" rx="2" transform="rotate(45 54 32)" />
      </>
    ),
    "power-banks": (
      <>
        <rect x="16" y="10" width="32" height="46" rx="5" />
        <rect x="24" y="6" width="16" height="4" rx="1" />
        <path d="M32 23l-3 7h6l-3 7" />
        <circle cx="24" cy="46" r="1.5" />
        <circle cx="32" cy="46" r="1.5" />
        <circle cx="40" cy="46" r="1.5" />
      </>
    ),
    "hubs-adapters": (
      <>
        <rect x="16" y="12" width="32" height="40" rx="6" />
        <line x1="32" y1="52" x2="32" y2="60" />
        <circle cx="32" cy="60" r="2" />
        <path d="M10 22h6m-6 10h6m-6 10h6" />
      </>
    ),
    "stands-mounts": (
      <>
        <path d="M12 48l14-26 12 10 14-8" />
        <path d="M8 54h48" />
        <rect x="22" y="12" width="20" height="28" rx="2" transform="rotate(-15 32 26)" />
      </>
    ),
    "phone-cases": (
      <>
        <rect x="16" y="8" width="32" height="48" rx="7" />
        <rect x="22" y="14" width="12" height="16" rx="3" />
        <circle cx="28" cy="22" r="3" />
      </>
    ),
  };

  return (
    <svg
      viewBox="0 0 64 64"
      fill="none"
      stroke="currentColor"
      strokeWidth="2.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      {shapes[icon] || shapes.laptop}
    </svg>
  );
}

export default function QuickCategories() {
  return (
    <nav className={styles.strip} aria-label="Mua sắm theo danh mục">
      <div className={styles.inner}>
        {quickCategories.map((category) => (
          <Link
            key={category.slug}
            href={`/categories/${category.slug}`}
            className={styles.item}
          >
            <span className={styles.icon}>
              <CategoryIcon icon={category.icon} />
            </span>
            <span className={styles.label}>{category.label}</span>
          </Link>
        ))}
      </div>
    </nav>
  );
}
