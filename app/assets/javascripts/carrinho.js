document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

l('oi')

expandBtn = document.getElementsByClassName('carrinho-expand-btn')[0]
expandContentCarrinho = document.getElementsByClassName('container-carrinho')[0]
checkoutBox = document.getElementsByClassName('container-carrinho-header-expand')[0]
// Start hidden by default, open if cart=o on parameters
if (document.getElementsByClassName('open-cart')[0]) {
  expandContentCarrinho.style.display = ""
} else {
  expandContentCarrinho.style.display = "none"
}


// ------------------------------------------------------------------------------
// On desktop, make order summary aligned with first burgers
// If there are no active orders banner, take the distance between navbar and first burger
// And make cart aligned to it. If there is active orders, adjust to it
orderSummaryElement = document.getElementsByClassName('carrinho-whole')[0]
posFirstBurger = document.getElementsByClassName('burger-card')
posFirstBurger = posFirstBurger[0].getBoundingClientRect().top;
posNavbarEnd = document.getElementsByClassName('navbar-wagon')[0].getBoundingClientRect().bottom;
activeOrdersBanner = document.getElementsByClassName('alert-pedidosemaberto')[0]

if (screen.width > 800) {
  orderSummaryElement.style.marginTop = (posFirstBurger - posNavbarEnd - 20) + 'px'
  if (activeOrdersBanner) {
    orderSummaryElement.style.marginTop = (posFirstBurger - posNavbarEnd - 20 - activeOrdersBanner.offsetHeight) + 'px'
  } else {
    orderSummaryElement.style.marginTop = (posFirstBurger - posNavbarEnd - 20) + 'px'
  }
}
// -------------------------------------------------------------------------------

expandBtn.addEventListener('click', function() {
  if (expandContentCarrinho.style.display === "none") {
    // ------------------------------------------------------------------------------
    // On desktop, make the cart at least the same size as the menu
    posLastCard = document.getElementsByClassName('bebida-card')
    posLastCard = posLastCard[posLastCard.length - 1].getBoundingClientRect().bottom;
    posTopCart = checkoutBox.getBoundingClientRect().bottom;

    if (screen.width > 800) {
      expandContentCarrinho.style.minHeight = (posLastCard - posTopCart) + 'px'
    }
    // -------------------------------------------------------------------------------

    expandContentCarrinho.style.display = ""


  } else {
    expandContentCarrinho.style.display = "none"
  }
});




});
