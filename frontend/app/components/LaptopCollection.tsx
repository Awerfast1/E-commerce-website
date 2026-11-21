"use client";
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useEffect, useState } from "react";
import { gamingDealsEndAt, gamingLaptopDeals, gamingLaptopSlug } from "../../data/gamingLaptopDeals";
import { getGamingLaptopSpecifications } from "../../data/gamingLaptopSpecifications";
import LaptopIllustration from "./LaptopIllustration";
import css from "./LaptopCollection.module.css";

const limits = [14.5,25,32.9,44.5,74.1,250];
const ranges = limits.slice(1).map((upper,i)=>`Từ ${limits[i]} triệu – ${upper} triệu`);
const ram = ["8 GB đến dưới 16 GB","16 GB đến dưới 32 GB","32 GB trở lên"];
const seed: Record<string,string[]> = {
  "Khoảng giá":ranges,"Dòng CPU":["Ryzen 7","Core Ultra 9","Core 5","Ryzen 9","Core 7"],"Dòng GPU":["RTX 5050","RTX 3050","RTX 5060","RTX 5070","RTX 4050","RTX 5070 Ti"],
  "Dòng sản phẩm":["TUF Gaming","ROG Zephyrus","LOQ","Nitro ProPanel","Nitro"],RAM:ram,"Hãng CPU":["Intel","AMD"],"Hãng sản xuất":["Acer","ASUS","Lenovo","MSI","GIGABYTE","Alienware"],
  "Thế hệ CPU":["Core 200H","Gen 13","Gen 14","Ryzen 7000","Ryzen 8000","Panther Lake"],SSD:["256 GB","512 GB","1 TB","2 TB"],
  "Màu sắc":["Xám","Đen","Bạc","Xanh","Trắng"],"Số khe RAM":["0","1","2","4"],"Số khe SSD":["1","2","3"],"Chuẩn SSD":["M.2 NVMe PCIe Gen4","NVMe"],
  "Loại RAM":["DDR5","DDR4","LPDDR5X","DDR5 SO-DIMM"],"Tần số quét":["60 Hz","120 Hz","144 Hz","165 Hz"],"Phụ kiện đi kèm":["Sách hướng dẫn","Bộ sạc","Túi xách"],
  "Số thanh RAM":["1","2","4"],"Độ sáng màn hình":["250 nit","300 nit","350 nit","500 nit"],"RAM onboard":["Không","Có"],
  "Công nghệ âm thanh":["Smart Amp Technology","SonicMaster","Dolby Atmos","Dolby Audio"],"Chất liệu vỏ (mặt trên)":["Nhựa","Nhôm","Kim loại","Mg-Al","Ceraluminum"],
  "Chất liệu vỏ (mặt dưới)":["Nhựa","Nhôm","Nhựa PC-ABS"],"Giao thức SSD":["NVMe","M.2 PCIe"],"Chất liệu vỏ (màn hình)":["Nhựa","Nhôm","Mg-Al"],
  "Màn hình cảm ứng":["Không","Có"],"Chuẩn giao tiếp SSD":["PCIe 4.0","PCIe 5.0"],"Chuẩn Wifi/Bluetooth":[],
  "Form factor SSD":["M.2","M.2 2280","M.2 2242"],"Hệ điều hành":["Windows 11 Home","Windows 11 Home Single Language","DOS","Free DOS"],
  "Trọng lượng":["1.23 kg","1.4 kg","1.62 kg","1.85 kg"],Webcam:["HD 720p","Full HD","1080p FHD + IR"]
};

const laptops = gamingLaptopDeals.map((product,index)=>{
  const specs = Object.fromEntries(getGamingLaptopSpecifications(index).flatMap(g=>g.rows));
  const protocol = specs["Giao thức SSD"] || "";
  const values: Record<string,string> = {...specs,
    "Dòng CPU":product.cpu.match(/^(Core (?:Ultra )?i?\d|Ryzen (?:AI )?\d)/)?.[0] || product.cpu,
    "Dòng GPU":product.gpu,"Hãng sản xuất":({ACER:"Acer",LENOVO:"Lenovo",ALIENWARE:"Alienware",ASUS:"ASUS"})[product.brand],
    "Dòng sản phẩm":product.name.includes("ANV16S")?"Nitro ProPanel":product.name.match(/ROG Strix|ROG Zephyrus|TUF Gaming|Predator Helios|Nitro|Legion Pro|Legion|Area-51/)?.[0] || product.name,
    RAM:ram[parseInt(product.ram)>=32?2:parseInt(product.ram)>=16?1:0],SSD:product.storage.replace(" SSD",""),
    "Số khe RAM":specs["Khe RAM"]?.split(" ")[0],"Số khe SSD":(specs["Khe SSD"]||specs["Khe M.2"])?.split(" ")[0],
    "Độ sáng màn hình":specs["Độ sáng"],"Chuẩn SSD":protocol,"Chuẩn giao tiếp SSD":protocol.includes("4.0")?"PCIe 4.0":"",
    "Chuẩn Wifi/Bluetooth":[specs["Wi-Fi"],specs.Bluetooth && "Bluetooth "+specs.Bluetooth].filter(Boolean).join(", "),
    "Thế hệ CPU":product.cpu.includes("14650")?"Gen 14":product.cpu.includes("Core Ultra") && / 2\d\d/.test(product.cpu)?"Core Ultra Series 2":"",
    "Loại RAM":specs["Loại RAM"]?.match(/LPDDR5X|DDR5|DDR4/)?.[0] || ""
  };
  return {product,index,values};
});
const options = Object.fromEntries(Object.entries(seed).map(([key,defaults])=>[key,[...new Set([...defaults,...laptops.map(l=>l.values[key]).filter(Boolean)])]]));
const money = (n:number)=>n.toLocaleString("vi-VN")+"đ";

export default function LaptopCollection(){
  const searchParams = useSearchParams();

  const brandParam = searchParams.get("brand");
  const seriesParam = searchParams.get("series");
  const gpuParam = searchParams.get("gpu");
  const cpuParam = searchParams.get("cpu");
  const minParam = searchParams.get("min") ?? "";
  const maxParam = searchParams.get("max") ?? "";

  const initialFilters: Record<string, string> = {};
  if (brandParam) {
    const match = ["Acer", "ASUS", "Lenovo", "Alienware"].find(b => b.toLowerCase() === brandParam.toLowerCase());
    if (match) initialFilters["Hãng sản xuất"] = match;
  }
  if (seriesParam) initialFilters["Dòng sản phẩm"] = seriesParam;
  if (gpuParam) initialFilters["Dòng GPU"] = gpuParam;
  if (cpuParam) initialFilters["Dòng CPU"] = cpuParam;

  const [userFilters, setUserFilters] = useState<Record<string, string> | null>(null);
  const [userMin, setUserMin] = useState<string | null>(null);
  const [userMax, setUserMax] = useState<string | null>(null);
  const [expanded, setExpanded] = useState<Record<string, boolean>>({});
  const [sort, setSort] = useState("Mặc định");
  const [sale, setSale] = useState(false);

  const activeFilters = userFilters ?? initialFilters;
  const activeMin = userMin ?? minParam;
  const activeMax = userMax ?? maxParam;

  useEffect(() => {
    const end = Date.parse(gamingDealsEndAt);
    const delay = end - Date.now();
    if (delay <= 0) return;

    const timer = setTimeout(() => {
      setSale(Date.now() < end);
    }, 0);

    const endTimer = setTimeout(() => {
      setSale(false);
    }, delay);

    return () => {
      clearTimeout(timer);
      clearTimeout(endTimer);
    };
  }, []);

  function reset(){
    setUserFilters({});
    setUserMin("");
    setUserMax("");
  }

  function toggle(key:string,value?:string){
    if(key==="Khoảng giá"){
      setUserMin("");
      setUserMax("");
    }
    setUserFilters(old => ({ ...(old ?? activeFilters), [key]: value ?? "" }));
  }

  const rows = laptops.map(l=>({...l,price:sale?l.product.price:l.product.oldPrice})).filter(({values,price})=>
    (!activeMin || price>=Number(activeMin)) && (!activeMax || price<=Number(activeMax)) && Object.entries(activeFilters).every(([key,value])=>{
      if(!value)return true;
      if(key!=="Khoảng giá")return values[key] === value;
      const i=ranges.indexOf(value); return price>=limits[i]*1e6 && (price<limits[i+1]*1e6 || (i===ranges.length-1 && price===limits[i+1]*1e6));
    }));

  if(sort==="Giá tăng dần")rows.sort((a,b)=>a.price-b.price);
  if(sort==="Giá giảm dần")rows.sort((a,b)=>b.price-a.price);
  if(sort==="Tên A-Z")rows.sort((a,b)=>a.product.name.localeCompare(b.product.name,"vi"));

  return <main className={css.page}><nav className={css.breadcrumb} aria-label="Đường dẫn">
    <Link href="/">Trang chủ</Link><span aria-hidden="true">/</span><span aria-current="page">Laptop</span>
  </nav><h1>Laptop</h1><div className={css.layout}>
    <aside><header><strong>Bộ lọc tìm kiếm</strong><button onClick={reset}>Xóa lọc</button></header><div className={css.scroll}>
      {Object.entries(options).map(([key,choices])=><details open key={key}><summary>{key}</summary>
        <label><input type="radio" name={key} checked={!activeFilters[key]?.length && !(key==="Khoảng giá" && (activeMin||activeMax))} onChange={()=>toggle(key)}/> Tất cả</label>
        {(expanded[key]?choices:choices.slice(0,6)).map(v=><label key={v}><input type="radio" name={key} checked={activeFilters[key]===v} onChange={()=>toggle(key,v)}/> {v}</label>)}
        {choices.length>6 && <button onClick={()=>setExpanded({...expanded,[key]:!expanded[key]})}>{expanded[key]?"Thu gọn":"Xem thêm"}</button>}
        {key==="Khoảng giá" && <><small>Hoặc nhập khoảng giá (đồng)</small><div className={css.range}>{[activeMin,activeMax].map((v,i)=><input key={i} aria-label={i?"Giá tối đa":"Giá tối thiểu"} type="number" min="0" placeholder={i?"Đến":"Từ"} value={v} onChange={e=>{setUserFilters(old=>({... (old ?? activeFilters),[key]:""}));(i?setUserMax:setUserMin)(e.target.value);}}/>)}</div></>}
      </details>)}</div></aside>
    <section><header className={css.toolbar}>
      <span aria-live="polite">Tìm thấy <b>{rows.length}</b> kết quả</span>
      <div className={css.sortOptions} role="group" aria-label="Sắp xếp laptop">
        {["Mặc định","Giá tăng dần","Giá giảm dần","Tên A-Z"].map((option,i)=>
          <span key={option}>
            {i > 0 && <i aria-hidden="true">•</i>}
            <button type="button" aria-pressed={sort===option} onClick={()=>setSort(option)}>{option}</button>
          </span>
        )}
      </div>
    </header>
    <div className={css.grid}>{rows.map(({product:p,index,price})=><Link className={css.card} key={p.name} href={`/gaming-laptops/${gamingLaptopSlug(p.name)}`}><div className={css.art}><LaptopIllustration index={index}/></div><h2>{p.name}</h2><p>{[p.cpu,p.gpu,p.ram+" RAM",p.storage,p.screen].join(" · ")}</p><footer>{sale && <small><del>{money(p.oldPrice)}</del>　−{Math.round((1-price/p.oldPrice)*100)}%</small>}<strong>{money(price)}</strong></footer></Link>)}</div>
    {!rows.length && <div className={css.empty}><h2>Không tìm thấy laptop phù hợp</h2><button onClick={reset}>Xóa bộ lọc</button></div>}</section>
  </div></main>;
}
