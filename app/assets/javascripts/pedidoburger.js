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

//Funcao: Entra com o innerHTML com um valor do tipo $x.yz string e sai como x.yz decimal
function getValue(div) {
  valor = div.innerHTML.trim()

  while (valor[0] === '+' || valor[0] === '$') {
    valor = valor.substring(1)
  }

  return parseFloat(valor)
}

//Elementos
ingredientQuantity = document.getElementsByClassName('ingrediente-quantidade')
ingredientNames = document.getElementsByClassName('ingrediente-nome')
ingredientFormInputs = document.getElementsByClassName('ingrediente-quantidade-input')
ingredientFormInputsName = document.getElementsByClassName('ingrediente-nome-input')
precoInput = document.getElementsByClassName('preco-input')[0]

precoBase = document.getElementsByClassName('burger-card-preco-build-base')[0]
precoExtra = document.getElementsByClassName('burger-card-preco-build-extra')[0]
precosIngredientes = document.getElementsByClassName('ingrediente-preco')

continuarBotao = document.getElementById('comprar-burger-btn')

//Atualizar preco botao
continuarBotao.value = 'Fazer pedido ($' + formatter.format(getValue(precoBase)).toString() + ')'

precoBaseValor = getValue(precoBase)
precoInput.value = formatter.format(precoBaseValor).toString()

//Ingredientes base - default value
Array.prototype.forEach.call(ingredientFormInputs, formInput => {
  formInputGroup = (index(formInput) - 5) / 2

  if (ingredientQuantity[3 * formInputGroup].classList.contains('ingrediente-ativo')) {
    formInput.value = '0';
  } else if (ingredientQuantity[3 * formInputGroup + 1].classList.contains('ingrediente-ativo')) {
    formInput.value = '1';
  } else {
    formInput.value = '2';
  }
});

l(ingredientNames)
Array.prototype.forEach.call(ingredientFormInputsName, formInput => {
  //Pega o index do forminput do tipo nome
  //Pega o index do input no form e substrai quantos inputs do tipo quantidade existe
  //Isso porque os form inputs de quantidade vem antes dos form inputs de nome
  //Logo, os form inputs de nome comecam em um index apos o ultimo form input de quantidade
  formInputGroup = (index(formInput) - 5) / 2 - ingredientFormInputs.length

  formInput.value = ingredientNames[formInputGroup].innerHTML.trim()

});

// Mudanca entre ingredientes
Array.prototype.forEach.call(ingredientQuantity, quantity => {
  // Event listener de clique em cada um das janelas de ingrediente
  quantity.addEventListener('click', function() {

    //Definir qual instancia de quantidade de ingrediente foi clicada
    var allQuantities = [].slice.call(ingredientQuantity);
    globalClicked = allQuantities.indexOf(quantity)
    // Obter qual o grupo clicado a partir da instancia
    groupClicked = (globalClicked - globalClicked % 3) / 3
    // Obter qual a posicao do grupo clicado a partir da instancia
    optionClicked = globalClicked - 3 * groupClicked

    // l(optionClicked)
    // l(groupClicked)
    // l(globalClicked)

    if (ingredientQuantity[groupClicked * 3].classList.contains('ingrediente-ativo')) {
      previousOption = groupClicked * 3
    } else if (ingredientQuantity[groupClicked * 3 + 1].classList.contains('ingrediente-ativo')) {
      previousOption = groupClicked * 3 + 1
    } else if (ingredientQuantity[groupClicked * 3 + 2].classList.contains('ingrediente-ativo')) {
      previousOption = groupClicked * 3 + 2
    }

    // Apagar todas as caixas daquele ingrediente ()
    ingredientQuantity[groupClicked * 3].classList.remove('ingrediente-ativo')
    ingredientQuantity[groupClicked * 3 + 1].classList.remove('ingrediente-ativo')
    ingredientQuantity[groupClicked * 3 + 2].classList.remove('ingrediente-ativo')
    // Acender a caixa que foi clicada
    ingredientQuantity[globalClicked].classList.add('ingrediente-ativo')
    // Atualizar o input do form
    ingredientFormInputs[groupClicked].value = optionClicked.toString()

    //Atualizar o preco do sanduiche
    precoExtraValorAntigo = getValue(precoExtra)

    l(precoExtraValorAntigo)

    precoExtraIngredienteAnterior = getValue(precosIngredientes[previousOption])
    precoExtraIngredienteAtual = getValue(precosIngredientes[globalClicked])

    precoExtraValorNovo = precoExtraValorAntigo + (precoExtraIngredienteAtual - precoExtraIngredienteAnterior)

    precoExtra.innerHTML = '+' + formatter.format(precoExtraValorNovo).toString()

    precoTotal = precoBaseValor + precoExtraValorNovo

    precoInput.value = formatter.format(precoTotal).toString()

    continuarBotao.value = 'Fazer pedido ($' + formatter.format(precoTotal).toString() + ')'
  });
});

});
