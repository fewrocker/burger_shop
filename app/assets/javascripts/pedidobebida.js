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


var formatter = new Intl.NumberFormat('en-US', {
  style: 'decimal',
  minimumFractionDigits: 2,
});

// Inicializar componentes
var adicionarMinusBtn = document.getElementsByClassName('bebida-modal-quantidade-controller-minus')
var adicionarPlusBtn = document.getElementsByClassName('bebida-modal-quantidade-controller-plus')
var adicionarBebidaCount = document.getElementsByClassName('bebida-modal-quantidade-controller-input')
var adicionarBebidaCountInput = document.getElementsByClassName('bebida-quantidade-input')
var adicionarBebidaBtn = document.getElementsByClassName('adicionar-bebida-btn')
var adicionarBebidaPrecoTotal = document.getElementsByClassName('bebida-modal-valor-total')

var bebidaPrecos = document.getElementsByClassName('bebida-card-preco-hidden')

var precoUnitario  = 0

// Todos os modals acontecem ao mesmo tempo, mas  apenas um pedido sera feito
// Logo, qualquer evento de qualquer modal altera o valor em todos os outros, mas isso nao importa pois
// O pedido so sera feito em relacao ao modal aberto. Quando o pedido completa, a  pagina recarrega e todos
// os valores voltam a default. Se um modal fecha e outro é aberto, todos os valores são resetados para default

// Ao clicar adicionar bebida, antes de abrir o popup, zerar todos os valores de inputs de bebida que
// Foram alterados anteriormente para 1 (default). Alem disso, setar o preco unitario da bebida que foi clicada
Array.prototype.forEach.call(adicionarBebidaBtn, adicionar => {
  adicionar.addEventListener('click', function() {

    bebidaIndex = (index(adicionar.parentNode.parentNode.parentNode)-1)/2
    precoUnitario = parseFloat(bebidaPrecos[bebidaIndex].innerHTML)

    Array.prototype.forEach.call(adicionarBebidaPrecoTotal, input => {
      input.innerHTML = '$' + formatter.format(precoUnitario).toString()
    });

    Array.prototype.forEach.call(adicionarBebidaCount, input => {
      input.innerHTML = 1
    });

    Array.prototype.forEach.call(adicionarBebidaCountInput, input => {
      input.value = 1
    });
  });
});

// Ao clicar no simbolo de +, aumentar 1 na quantidade do mostrador e no input do form
Array.prototype.forEach.call(adicionarPlusBtn, plus => {
  plus.addEventListener('click', function() {
    Array.prototype.forEach.call(adicionarBebidaCount, input => {
      input.innerHTML = (parseInt(input.innerHTML,10) + 1)

      Array.prototype.forEach.call(adicionarMinusBtn, minus => {
        minus.style.color = 'red'
      });
    });

    Array.prototype.forEach.call(adicionarBebidaCountInput, input => {
      input.value = (parseInt(input.value,10) + 1)
    });

    Array.prototype.forEach.call(adicionarBebidaPrecoTotal, input => {
      input.innerHTML = '$' + formatter.format(precoUnitario * parseInt(adicionarBebidaCount[0].innerHTML,10)).toString()
    });
  });
});

// Ao clicar no simbolo de -, diminuir 1 na quantidade do mostrador e no input do form
Array.prototype.forEach.call(adicionarMinusBtn, minus => {
  minus.addEventListener('click', function() {

    if  (adicionarBebidaCount[0].innerHTML !== '1') {
      Array.prototype.forEach.call(adicionarBebidaCount, input => {
        input.innerHTML = (parseInt(input.innerHTML,10) - 1)

        if (input.innerHTML === '1')  {
          minus.style.color = 'gray'
        }
      });

      Array.prototype.forEach.call(adicionarBebidaCountInput, input => {
        input.value = (parseInt(input.value,10) - 1)
      });

      Array.prototype.forEach.call(adicionarBebidaPrecoTotal, input => {
        input.innerHTML = '$' + formatter.format(precoUnitario * parseInt(adicionarBebidaCount[0].innerHTML,10)).toString()
      });
    }
  });
});


});
