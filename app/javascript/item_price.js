const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const price = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;
  })
}; 
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);