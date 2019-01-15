document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

expandBtn = document.getElementsByClassName('carrinho-expand-btn')[0]
expandContentCarrinho = document.getElementsByClassName('container-carrinho')[0]
posLastCard = document.getElementsByClassName('bebida-card')
posLastCard = posLastCard[posLastCard.length - 1].getBoundingClientRect().bottom;
posTopCart = expandContentCarrinho.getBoundingClientRect().top;

// ------------------------------------------------------------------------------
// On desktop, make the cart at least the same size as the menu
posLastCard = document.getElementsByClassName('bebida-card')
posLastCard = posLastCard[posLastCard.length - 1].getBoundingClientRect().bottom;
posTopCart = expandContentCarrinho.getBoundingClientRect().top;

if (screen.width > 800) {
  expandContentCarrinho.style.minHeight = (posLastCard - posTopCart) + 'px'
}
// -------------------------------------------------------------------------------

expandBtn.addEventListener('click', function() {
  if (expandContentCarrinho.style.display === "none") {
    expandContentCarrinho.style.display = ""
  } else {
    expandContentCarrinho.style.display = "none"
  }
});




});
