document.addEventListener('DOMContentLoaded', function() {

// Log shortcut
function l(x) {
  console.log(x);
}

function index(el) {
    var children = el.parentNode.childNodes,
        i = 0;
    for (; i < children.length; i++) {
        if (children[i] == el) {
            return i;
        }
    }
    return -1;
}

pedidoIndexHeader = document.getElementsByClassName('pedido-index-user-cadapedido-header')
pedidoIndexBody = document.getElementsByClassName('pedido-index-user-cadapedido-body')

Array.prototype.forEach.call(pedidoIndexHeader, header => {
  header.addEventListener('click', function() {

    // Obter o index do pedido clicado
    // O index esta inserido na segunda classe do header no formato pedido-header{index}
    // Logo, pegar a segunda classe do header e entao pegar apenas os numeros

    headerIndex = parseInt(header.classList[1].match(/\d+/g)[0],10)

    if (pedidoIndexBody[headerIndex].style.display == '') {
      pedidoIndexBody[headerIndex].style.display = 'none'
    } else {
      pedidoIndexBody[headerIndex].style.display = ''
    }

  });
});









});

