"use client";

import styles from "./GamingLaptopSpecs.module.css";

type SpecRow = readonly [string, string];
type Props = { name: string; specs: readonly SpecRow[]; image?: string };

const highlightNames = ["CPU", "Processor", "Dòng CPU", "Dung lượng RAM", "RAM", "Dung lượng SSD", "Storage", "Card đồ họa", "Graphics Card", "Dòng GPU", "Kích thước màn hình", "Screen Size", "Màn hình", "Refresh Rate"];
const icon = <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="2" y="4" width="20" height="15" rx="2"/><path d="M12 19v3m-5 0h10"/></svg>;

export default function ProductSpecsDrawer({ name, specs, image }: Props) {
  const panelId = `product-specs-${name.toLowerCase().replace(/[^a-z0-9]+/g,"-")}`;
  const chosen = specs.filter(([label]) => highlightNames.includes(label)).slice(0, 6);
  const highlights = (chosen.length ? chosen : specs.slice(0, 6)).slice(0, 6);

  return <>
    <section className={styles.highlights} aria-label="Thông số nổi bật">
      <div className={styles.heading}><h2>Thông số nổi bật</h2><button type="button" popoverTarget={panelId} aria-haspopup="dialog">Xem tất cả thông số <span aria-hidden="true">›</span></button></div>
      <div className={styles.grid}>{highlights.map(([label,value])=><div className={styles.highlight} key={label}><span>{label}</span><strong>{icon}{value}</strong></div>)}</div>
    </section>
    <aside id={panelId} popover="auto" className={styles.drawer} role="dialog" aria-label={`Thông số kỹ thuật ${name}`}>
      <header className={styles.drawerHeader}><h2>Thông số kỹ thuật</h2><button type="button" popoverTarget={panelId} popoverTargetAction="hide" aria-label="Đóng thông số">×</button></header>
      <div className={styles.drawerBody}>
        <div className={styles.product}>{image ? <img src={image} alt="" /> : <div className={styles.productFallback}>{icon}</div>}<strong>{name}</strong></div>
        <section className={styles.group}><h3>Thông số kỹ thuật</h3><dl>{specs.map(([label,value])=><div key={label}><dt>{label}</dt><dd>{value}</dd></div>)}</dl></section>
      </div>
    </aside>
  </>;
}
