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

// On mobile, place order summary on top of menu
if (screen.width < 800) {
  // Create a new element
  var newNode = document.getElementsByClassName('carrinho-whole')[0]

  // Get the reference node
  var referenceNode = document.getElementsByClassName('container-cardapio')[0]

  // Insert the new node before the reference node
  referenceNode.parentNode.insertBefore(newNode, referenceNode);
}







});
