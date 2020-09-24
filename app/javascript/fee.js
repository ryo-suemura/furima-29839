function fee() {
  const price = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("input", () => {
      const value = price.value;

      if (value >=300 && value <= 9999999) {
        let tax = Math.floor(value * 0.1);
        let gains = value - tax;
        add_tax.textContent = tax;
        profit.textContent = gains;
      }
   });
}
window.addEventListener("load", fee);