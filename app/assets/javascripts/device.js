document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

// contentDesktop = document.getElementsByClassName('d-desktop')[0]
// contentMobile= document.getElementsByClassName('d-mobile')[0]

// if (screen.width > 800) {
//   contentMobile.style.display = ''
// } else {
//   contentDesktop.style.display = ''
// }

if (screen.width < 800) {
  // On mobile, place order summary on top of menu
  // Create a new element
  var newNode = document.getElementsByClassName('carrinho-whole')[0]

  // Get the reference node
  var referenceNode = document.getElementsByClassName('container-cardapio')[0]

  // Insert the new node before the reference node
  referenceNode.parentNode.insertBefore(newNode, referenceNode);


  // On mobile, make the cart a little box instead of width = 100%
  newNode.style.padding = '10px 10px'

  // On mobile, make burgers and drinks on the menu expandable and make styling changes
  expandBtnBurgers = document.getElementsByClassName('cardapio-title-burger')[0]
  expandContentBurgers = document.getElementsByClassName('container-burgers-content')[0]
  expandBtnDrinks = document.getElementsByClassName('cardapio-title-drinks')[0]
  expandContentDrinks = document.getElementsByClassName('container-drinks-content')[0]

  // Styling on mobile
  expandBtnBurgers.style.backgroundColor = 'gray'
  expandBtnBurgers.style.padding = '20px'
  expandBtnBurgers.innerHTML = '(+) Burgers'
  expandBtnDrinks.style.backgroundColor = 'gray'
  expandBtnDrinks.style.padding = '20px'
  expandBtnDrinks.innerHTML = '(+) Drinks'
  expandBtnDrinks.style.margin = '0px'
  document.querySelector('.wrapper-cardapio').style.paddingBottom = '20px'

  // Start hidden
  expandContentBurgers.style.display = "none"
  expandContentDrinks.style.display = "none"

  expandBtnBurgers.addEventListener('click', function() {
    if (expandContentBurgers.style.display === "none") {
      expandBtnBurgers.innerHTML = '(-) Burgers'
      expandContentBurgers.style.display = ""

    } else {
      expandBtnBurgers.innerHTML = '(+) Burgers'
      expandContentBurgers.style.display = "none"
    }
  });

  expandBtnDrinks.addEventListener('click', function() {
    if (expandContentDrinks.style.display === "none") {
      expandBtnDrinks.innerHTML = '(-) Drinks'
      expandContentDrinks.style.display = ""
    } else {
      expandBtnDrinks.innerHTML = '(+) Drinks'
      expandContentDrinks.style.display = "none"
    }
  });



}






});
