document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

l('oi')

expandBtn = document.getElementsByClassName('carrinho-expand-btn')[0]
expandContentCarrinho = document.getElementsByClassName('container-carrinho')[0]
checkoutBox = document.getElementsByClassName('container-carrinho-header-expand')[0]
// Start hidden
expandContentCarrinho.style.display = "none"

// ------------------------------------------------------------------------------
// On desktop, make order summary aligned with first burgers
orderSummaryElement = document.getElementsByClassName('carrinho-whole')[0]
posFirstBurger = document.getElementsByClassName('burger-card')
posFirstBurger = posFirstBurger[0].getBoundingClientRect().top;
posNavbarEnd = document.getElementsByClassName('navbar-wagon')[0].getBoundingClientRect().bottom;
if (screen.width > 800) {
  orderSummaryElement.style.marginTop = (posFirstBurger - posNavbarEnd - 20) + 'px'
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
