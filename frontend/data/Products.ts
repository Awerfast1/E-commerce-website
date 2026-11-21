
import type { Product } from "../types/catalog";

export const products: Product[] = [
  {
    id: 101,
    name: "ASUS ROG Strix X870-E Gaming WiFi",
    sku: "ASUS-X870E-001",
    modelNumber: "ROG-STRIX-X870E",

    brand: {
      id: 1,
      name: "ASUS",
    },

    categoryId: 3,

    price: 599,

    shortDescription: "High-performance AM5 gaming motherboard.",

    longDescription:
      "A high-performance motherboard designed for gaming and demanding desktop workloads.",

    images: [
      "/images/products/x870-front.jpg",
      "/images/products/x870-back.jpg",
    ],

    specifications: [
      { name: "Socket", value: "AM5" },
      { name: "Chipset", value: "X870" },
      { name: "RAM Slots", value: 4 },
      { name: "Form Factor", value: "ATX" },
      { name: "WiFi", value: "WiFi 7" },
    ],
  },

  {
    id: 102,
    name: "Gaming Laptop 16-inch",
    sku: "LAPTOP-001",
    modelNumber: "GAMING-16",

    brand: {
      id: 2,
      name: "MSI",
    },

    categoryId: 8,

    price: 2499,

    shortDescription: "High-performance gaming laptop.",

    longDescription:
      "A gaming laptop designed for demanding games and productivity workloads.",

    images: [
      "/images/products/laptop-front.jpg",
    ],

    specifications: [
      { name: "Processor", value: "AMD Ryzen 7" },
      { name: "RAM", value: 32, unit: "GB" },
      { name: "Storage", value: 1, unit: "TB SSD" },
      { name: "Screen Size", value: 16, unit: "inches" },
      { name: "Graphics Card", value: "RTX 5070" },
      { name: "Refresh Rate", value: 240, unit: "Hz" },
    ],

    promotion: {
      discount: 15,
      discountType: "percentage",
      startDate: "2026-11-01",
      endDate: "2026-12-01",
    },
  },
];
