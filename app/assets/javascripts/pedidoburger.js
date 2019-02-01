document.addEventListener('DOMContentLoaded', function() {

// The goal of this function is to handle the user interaction while customizing his burger
// The view shows all ingredients and all possible quantities for each ingredient with its price
// Ingredients start highlighted as Normal if the ingredient is a base ingredient for the burger
// Or start highlighted at none if not present
// If ingredient is a base ingredient, its normal cost is zero and extra cost is equal to ingredient_cost
// If ingredient is not a base ingredient, normal cost is ingredient_cost and extra cost is equal to 2 * ingredient_cost
// If user picks another configuration, highlight the selected option as user feedback
// Only one quantity can be picked for each ingredient, so if one quantity is picked, all the other highlights turns off
// Also, update the order price so the user can see how much the changes are costing

// Support functions
// Log shortcut
function l(x) {
  console.log(x);
}

// Get the index of the element related to its sibling elements on the Parent ChildNodes array
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

//Get the price of the ingredient from the HTML
// Input is of type "$x.yz" as an HTML string
// Output is a float with the value x.yz

function getValue(div) {
  valor = div.innerHTML.trim()

  while (valor[0] === '+' || valor[0] === '$') {
    valor = valor.substring(1)
  }

  return parseFloat(valor)
}

// -------------------------------------------------------------------

//Get needed elements
ingredientQuantity = document.getElementsByClassName('ingrediente-quantidade')
ingredientNames = document.getElementsByClassName('ingrediente-nome')
ingredientFormInputs = document.getElementsByClassName('ingrediente-quantidade-input')
ingredientFormInputsName = document.getElementsByClassName('ingrediente-nome-input')
precoInput = document.getElementsByClassName('preco-input')[0]

precoBase = document.getElementsByClassName('burger-card-preco-build-base')[0]
precoExtra = document.getElementsByClassName('burger-card-preco-build-extra')[0]
precosIngredientes = document.getElementsByClassName('ingrediente-preco')

continuarBotao = document.getElementById('comprar-burger-btn')

//Update the base price to the base price of the burger
continuarBotao.value = 'Add to order ($' + formatter.format(getValue(precoBase)).toString() + ')'

// Save the base price of the burger, so when the user makes changes,
// You can see the initial base price and the additional price
precoBaseValor = getValue(precoBase)
precoInput.value = formatter.format(precoBaseValor).toString()

//If ingredient is a base ingredient, start highlight at "normal"
//If ignredient is not base ingredient, start highlight at "none"
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

// Update the value on Rails form of each ingredient quantity
// If X is the number of ingredients in the Shop
// There are X inputs for the ingredient names
// And X inputs for the ingredient quantities
Array.prototype.forEach.call(ingredientFormInputsName, formInput => {
  formInputGroup = (index(formInput) - 5) / 2 - ingredientFormInputs.length
  formInput.value = ingredientNames[formInputGroup].innerHTML.trim()
});

// User clicks on a new quantity to customizse the burger
Array.prototype.forEach.call(ingredientQuantity, quantity => {
  // Event listener listens to the click
  quantity.addEventListener('click', function() {

    // Define which ingredient is being changed
    // Define globalClicked as the quantity index between all quantities on the page
    // This means: if there are 10 ingredients with 3 options, there are 30 global options
    // globalClicked is the global button clicked
    // From the global button, you can derive which ingredient and which quantity was selected
    // For example, if the button clicked was the 16th button of quantity on the page,
    // It is clear that it is related to the 6th ingredient on the page
    // and that the quantity selected was "None"
    // This is because there were 15 elements before it from the first 5th ingredients
    // And the 16th button is the first option for the 6th ingredient

    var allQuantities = [].slice.call(ingredientQuantity);
    // Global element
    globalClicked = allQuantities.indexOf(quantity)
    // Ingredient group
    groupClicked = (globalClicked - globalClicked % 3) / 3
    // Quantity inside ingredient
    optionClicked = globalClicked - 3 * groupClicked

    // Get which quantity was previously selected
    if (ingredientQuantity[groupClicked * 3].classList.contains('ingrediente-ativo')) {
      previousOption = groupClicked * 3
    } else if (ingredientQuantity[groupClicked * 3 + 1].classList.contains('ingrediente-ativo')) {
      previousOption = groupClicked * 3 + 1
    } else if (ingredientQuantity[groupClicked * 3 + 2].classList.contains('ingrediente-ativo')) {
      previousOption = groupClicked * 3 + 2
    }

    // Erase all highlights from this ingredient group
    ingredientQuantity[groupClicked * 3].classList.remove('ingrediente-ativo')
    ingredientQuantity[groupClicked * 3 + 1].classList.remove('ingrediente-ativo')
    ingredientQuantity[groupClicked * 3 + 2].classList.remove('ingrediente-ativo')
    // Highlight the selected quantity
    ingredientQuantity[globalClicked].classList.add('ingrediente-ativo')
    // Update the form value
    ingredientFormInputs[groupClicked].value = optionClicked.toString()

    //Update the total burger price, and the additional customization price
    precoExtraValorAntigo = getValue(precoExtra)

    // Get price of previous selected option
    precoExtraIngredienteAnterior = getValue(precosIngredientes[previousOption])
    // Get price of new selected option
    precoExtraIngredienteAtual = getValue(precosIngredientes[globalClicked])

    // Set the new extra price as the variation of new option price minus old option price
    precoExtraValorNovo = precoExtraValorAntigo + (precoExtraIngredienteAtual - precoExtraIngredienteAnterior)

    // Update the extra price innerHTML
    precoExtra.innerHTML = '+' + formatter.format(precoExtraValorNovo).toString()

    // Calculate the total price as base value (saved and store) and the current extra price
    precoTotal = precoBaseValor + precoExtraValorNovo

    // Change the total price on form
    precoInput.value = formatter.format(precoTotal).toString()

    // Change the HTML of the "Place order" button to show the correct total value
    continuarBotao.value = 'Place order ($' + formatter.format(precoTotal).toString() + ')'
  });
});

});
