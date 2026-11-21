(() => {
  const currency = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" });

  function syncSaleState(active) {
    document.querySelectorAll("[data-gaming-deals]").forEach(section => {
      section.style.display = active ? "" : "none";
    });
    document.querySelectorAll("[data-deal-price]").forEach(price => {
      price.textContent = currency.format(Number(active ? price.dataset.salePrice : price.dataset.originalPrice));
    });
    document.querySelectorAll("[data-deal-original], [data-deal-discount]").forEach(label => {
      label.style.display = active ? "" : "none";
    });
  }

  function initialize(section) {
    if (section.dataset.initialized) return;
    section.dataset.initialized = "true";

    const timer = section.querySelector("[data-deals-timer]");
    const days = timer.querySelector("[data-days]");
    const hours = timer.querySelector("[data-hours]");
    const minutes = timer.querySelector("[data-minutes]");
    const seconds = timer.querySelector("[data-seconds]");
    const track = section.querySelector("[data-deals-track]");

    const end = Date.parse(section.dataset.dealsEndAt);

    function updateTimer() {
      const remaining = Math.max(0, Math.ceil((end - Date.now()) / 1000));
      const dayCount = Math.floor(remaining / 86400);
      const hourCount = Math.floor((remaining % 86400) / 3600);
      const minuteCount = Math.floor((remaining % 3600) / 60);
      const secondCount = remaining % 60;

      days.textContent = `${dayCount} ngày`;
      hours.textContent = String(hourCount).padStart(2, "0");
      minutes.textContent = String(minuteCount).padStart(2, "0");
      seconds.textContent = String(secondCount).padStart(2, "0");
      timer.setAttribute("aria-label", remaining
        ? `Còn ${dayCount} ngày ${hourCount} giờ ${minuteCount} phút ${secondCount} giây`
        : "Chương trình đã kết thúc");
      syncSaleState(remaining > 0);
      if (remaining === 0) clearInterval(interval);
    }

    const interval = setInterval(updateTimer, 1000);
    updateTimer();

    section.querySelectorAll("[data-slide]").forEach(button => {
      button.addEventListener("click", () => {
        const direction = Number(button.dataset.slide);
        const viewport = track.getBoundingClientRect();
        const cards = Array.from(track.querySelectorAll("article"));
        const target = direction > 0
          ? cards.find(card => card.getBoundingClientRect().right > viewport.right + 1)
          : cards.filter(card => card.getBoundingClientRect().left < viewport.left - 1).at(-1);

        if (target) {
          const cardPosition = target.getBoundingClientRect().left - viewport.left;
          track.scrollTo({ left: track.scrollLeft + cardPosition, behavior: "smooth" });
        }
      });
    });
  }

  function initializeCatalog(section) {
    if (section.dataset.initialized) return;
    section.dataset.initialized = "true";
    section.querySelectorAll("[data-brand-filter]").forEach(button => {
      button.addEventListener("click", () => {
        const brand = button.dataset.brandFilter;
        section.querySelectorAll("[data-brand-filter]").forEach(filter => {
          filter.setAttribute("aria-pressed", String(filter === button));
        });
        section.querySelectorAll("[data-catalog-card]").forEach(card => {
          card.hidden = brand !== "TẤT CẢ" && card.dataset.brand !== brand;
        });
      });
    });
    syncSaleState(Date.now() < Date.parse(section.dataset.dealsEndAt));
  }

  function initializeAll() {
    document.querySelectorAll("[data-gaming-deals]").forEach(initialize);
    document.querySelectorAll("[data-laptop-catalog]").forEach(initializeCatalog);
    document.querySelectorAll("[data-deal-detail]").forEach(section => {
      if (section.dataset.initialized) return;
      section.dataset.initialized = "true";
      const end = Date.parse(section.dataset.dealsEndAt);
      syncSaleState(Date.now() < end);
      if (Date.now() < end) setTimeout(() => syncSaleState(false), end - Date.now());
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initializeAll, { once: true });
  } else {
    initializeAll();
  }
  new MutationObserver(initializeAll).observe(document.body, { childList: true, subtree: true });
})();
