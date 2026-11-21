import LaptopIllustration from "./LaptopIllustration";
import { getGamingLaptopSpecifications } from "../../data/gamingLaptopSpecifications";
import styles from "./GamingLaptopSpecs.module.css";

const icons = [
  <svg key="cpu" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="5" y="5" width="14" height="14" rx="2"/><path d="M9 9h6v6H9zM9 1v4m6-4v4M9 19v4m6-4v4M1 9h4m-4 6h4m14-6h4m-4 6h4"/></svg>,
  <svg key="ram" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="2" y="7" width="20" height="10" rx="2"/><path d="M6 10v4m4-4v4m4-4v4m4-4v4M5 17v3m5-3v3m5-3v3m5-3v3"/></svg>,
  <svg key="ssd" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="2" y="6" width="20" height="12" rx="2"/><path d="M5 14h14m-3-4h3"/></svg>,
  <svg key="gpu" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="2" y="5" width="20" height="14" rx="2"/><circle cx="10" cy="12" r="4"/><path d="M17 10h3m-3 4h3"/></svg>,
  <svg key="screen" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="2" y="3" width="20" height="15" rx="2"/><path d="M12 18v3m-5 0h10"/></svg>,
  <svg key="resolution" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6" aria-hidden="true"><rect x="2" y="3" width="20" height="15" rx="2"/><path d="m8 9 3 3 5-5M12 18v3m-5 0h10"/></svg>,
];

export default function GamingLaptopSpecs({ index, name }: { index: number; name: string }) {
  const panelId = `laptop-specs-${index}`;
  const groups = getGamingLaptopSpecifications(index);
  const base = groups.slice(1, 5);
  const screen = base[3].rows;
  const highlights = [
    ["Dòng CPU", base[0].rows[1][1]],
    ["Dung lượng RAM", base[1].rows[0][1]],
    ["Dung lượng SSD", base[1].rows[1][1]],
    ["Dòng GPU", base[2].rows[1][1]],
    ["Kích thước màn hình", screen[0][1]],
    ["Màn hình", screen[1][1]],
  ];

  return <>
    <section className={styles.highlights} aria-labelledby="highlight-heading">
      <div className={styles.heading}>
        <h2 id="highlight-heading">Thông số nổi bật</h2>
        <button type="button" popoverTarget={panelId} aria-haspopup="dialog">Xem tất cả thông số <span aria-hidden="true">›</span></button>
      </div>
      <div className={styles.grid}>{highlights.map(([label, value], iconIndex) => <div className={styles.highlight} key={label}>
        <span>{label}</span><strong>{icons[iconIndex]}{value}</strong>
      </div>)}</div>
    </section>
    <aside id={panelId} popover="auto" className={styles.drawer} role="dialog" aria-label={`Thông số kỹ thuật ${name}`}>
      <header className={styles.drawerHeader}>
        <h2>Thông số kỹ thuật</h2>
        <button type="button" popoverTarget={panelId} popoverTargetAction="hide" aria-label="Đóng thông số">×</button>
      </header>
      <div className={styles.drawerBody}>
        <div className={styles.product}><LaptopIllustration index={index} /><strong>{name}</strong></div>
        <section className={styles.group}>
          <h3>Thông số kỹ thuật</h3>
          <dl>{groups.flatMap(group => group.rows.map(([label, value]) =>
            <div key={group.title + label}><dt>{label}</dt><dd>{value}</dd></div>
          ))}</dl>
        </section>
      </div>
    </aside>
  </>;
}
