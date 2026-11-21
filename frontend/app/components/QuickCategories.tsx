import Link from "next/link";
import { quickCategories } from "../../data/quickCategories";
import styles from "./QuickCategories.module.css";

function CategoryIcon({ icon }: { icon: string }) {
  const shapes: Record<string, React.ReactNode> = {
    laptop: <><rect x="10" y="13" width="44" height="31" rx="3" /><path d="M5 50h54l-4-6H9z" /></>,
    monitor: <><rect x="7" y="11" width="50" height="35" rx="3" /><path d="M32 46v9m-12 0h24" /></>,
    mainboard: <><rect x="12" y="7" width="40" height="50" rx="3" /><rect x="22" y="17" width="20" height="20" rx="2" /><path d="M17 17h3m-3 8h3m-3 8h3m29-16h-3m3 8h-3m3 8h-3M21 44h22" /></>,
    cpu: <><rect x="15" y="15" width="34" height="34" rx="4" /><rect x="23" y="23" width="18" height="18" rx="2" /><path d="M21 8v7m11-7v7m11-7v7M21 49v7m11-7v7m11-7v7M8 21h7m-7 11h7m-7 11h7m34-22h7m-7 11h7m-7 11h7" /></>,
    vga: <><rect x="6" y="17" width="52" height="30" rx="3" /><circle cx="24" cy="32" r="9" /><circle cx="44" cy="32" r="9" /><path d="M12 47v5m36-5v5" /></>,
    ram: <><rect x="6" y="21" width="52" height="23" rx="2" /><path d="M14 21v-5m9 5v-5m9 5v-5m9 5v-5m9 5v-5M12 44v5m10-5v5m10-5v5m10-5v5m10-5v5M16 28h9v9h-9zm14 0h9v9h-9zm14 0h8v9h-8z" /></>,
    storage: <><rect x="8" y="17" width="48" height="30" rx="4" /><path d="M16 25h32M16 33h20m8 7h4" /></>,
    keyboard: <><rect x="5" y="20" width="54" height="28" rx="3" /><path d="M12 27h4m5 0h4m5 0h4m5 0h4m5 0h4M12 34h4m5 0h4m5 0h4m5 0h4m5 0h4M17 41h30" /></>,
  };

  return <svg viewBox="0 0 64 64" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">{shapes[icon]}</svg>;
}

export default function QuickCategories() {
  return (
    <nav className={styles.strip} aria-label="Mua sắm theo danh mục">
      <div className={styles.inner}>
        {quickCategories.map(category => (
          <Link key={category.slug} href={`/categories/${category.slug}`} className={styles.item}>
            <span className={styles.icon}><CategoryIcon icon={category.icon} /></span>
            <span>{category.label}</span>
          </Link>
        ))}
      </div>
    </nav>
  );
}
