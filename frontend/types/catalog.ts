
export type Category = {
  id: number;
  name: string;
  slug: string;
  image: string;
};

export type Brand = {
  id: number;
  name: string;
};

export type ProductAttribute = {
  name: string;
  value: string | number | boolean;
  unit?: string;
};

export type Product = {
  id: number;
  name: string;
  sku: string;
  modelNumber: string;

  brand: Brand;
  categoryId: number;

  price: number;

  shortDescription: string;
  longDescription: string;

  images: string[];

  specifications: ProductAttribute[];

  promotion?: {
    discount: number;
    discountType: "percentage" | "fixed";
    startDate: string;
    endDate: string;
  };
};
