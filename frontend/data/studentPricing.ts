export function studentPricing(price: number, verified: boolean) {
  const discount = verified ? Math.min(Math.round(price * 0.1), 500_000) : 0;
  return { discount, total: price - discount };
}
