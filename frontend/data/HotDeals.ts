
import { products } from "./Products";

export const hotDeals = products
  .filter((product) => product.promotion !== undefined)
  .map((product) => {
    const promotion = product.promotion!;

    const discount =
      promotion.discountType === "percentage"
        ? product.price * (promotion.discount / 100)
        : promotion.discount;

    return {
      ...product,
      oldPrice: product.price, //old price is the current price
      price: product.price - discount, //price is the discounted price
      discountLabel: //that stupid label on the top of the card to show how much discount it has
        promotion.discountType === "percentage"
          ? `${promotion.discount}% OFF`
          : `Save $${promotion.discount}`,
    };
  });
