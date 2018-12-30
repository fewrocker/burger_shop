class PedidoburgerController < ApplicationController
  def new
    if current_user.pedidos.select { |pedido| pedido.status == 'em compras'}.length == 0
      p = Pedido.new
      p.user = current_user
      p.endereco = ''
      p.status = 'em compras'
      p.save
    end

    @burger = Burger.find_by(nome: params[:burger])

    @ingredientes_carne = Ingrediente.all.select { |ing| ing.categoria == 'Carnes' }
    @ingredientes_queijo = Ingrediente.all.select { |ing| ing.categoria == 'Queijos' }
    @ingredientes_acompanhamentos = Ingrediente.all.select { |ing| ing.categoria == 'Acompanhamentos' }
    @ingredientes_salada = Ingrediente.all.select { |ing| ing.categoria == 'Salada' }
    @ingredientes_molho = Ingrediente.all.select { |ing| ing.categoria == 'Molhos' }

    @ingredientes_base = @burger.ingredientes_base

  end

  def create

    number_of_ingredients = Ingrediente.all.length

    b = Pedidoburger.new
    b.burger = params[:burger]
    b.pedido = current_user.pedidos.select { |pedido| pedido.status == 'em compras'}[0]
    number_of_ingredients.times do |num|
      b.ingredientes << params["ingrediente_nome_#{num}".to_sym]
      b.quantidades << params["ingrediente_quant_#{num}".to_sym]
    end
    b.preco = params[:preco].to_f
    b.save

    redirect_to cardapio_path
  end

  def destroy
    b = Pedidoburger.find(params[:id])
    b.destroy

    redir = params[:redir]

    if redir == "checkout"
      redirect_to checkout_path
    else
      redirect_to cardapio_path
    end
  end
end
