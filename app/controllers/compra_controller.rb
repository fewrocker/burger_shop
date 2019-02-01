class CompraController < ApplicationController

  def cardapio
    # If there are no "open" orders, create one so the user can start shopping
    if current_user.pedidos.select { |pedido| pedido.status == 'em compras'}.length == 0
      p = Pedido.new
      p.user = current_user
      p.endereco = ''
      p.status = 'em compras'
      p.save
    end

    # Update the order status
    Pedido.all.select {|pedido| pedido.status == 'em preparo' || pedido.status == 'saiu para entrega' }.each do |pedido|
      timeelapsed = ((Time.now - pedido.horario) / 60).round(0)

      if timeelapsed > 15 && timeelapsed <= 30
        pedido.status = 'saiu para entrega'
        pedido.save
      elsif timeelapsed > 30
        pedido.status = 'concluido'
        pedido.save
      end
    end

    # Create the "You have active orders" for user if he has one
    # The controller checks for orders on the database related to the current_user
    # And which has the status equals to one of the active order status
    # "Cooking" or "Out for delivery"

    if Pedido.all.select { |pedido| pedido.user == current_user && (pedido.status == 'em preparo' || pedido.status == 'saiu para entrega') }.length != 0
      @pedidos_em_aberto = true
    else
      @pedidos_em_aberto = false
    end

    # URL params to open/close cart
    @active_orders = params[:cart] == 'o'

    # Separate the items for the cart in burgers and drinks
    @lanches = Burger.all
    @bebidas_soft = Bebida.all.select { |bebida| bebida.categoria == 'Soft' }
    @bebidas_cervejas = Bebida.all.select { |bebida| bebida.categoria == 'Cervejas' }

    # Select the current open order for the user
    # Get the order which is related to current_user and has status "Shopping"
    @carrinho = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'em compras' }[0]
    @carrinho_burgers = @carrinho.pedidoburgers
    @carrinho_bebidas = @carrinho.pedidobebidas

    # Calculates the current order total
    # By adding the value of all items in the order
    # The price of all ingredients on the burger are already saved on the burger_order

    @carrinho_total = 0
    @carrinho_burgers.each do |burger|
      @carrinho_total += burger.preco
    end
    @carrinho_bebidas.each do |bebida|
      @carrinho_total += bebida.preco
    end
  end

  def checkout

    @carrinho = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'em compras' }[0]
    @carrinho_burgers = @carrinho.pedidoburgers
    @carrinho_bebidas = @carrinho.pedidobebidas

    @endereco = Endereco.find(@carrinho.enderecoid)

    @carrinho_total = 0
    @carrinho_burgers.each do |burger|
      @carrinho_total += burger.preco
    end
    @carrinho_bebidas.each do |bebida|
      @carrinho_total += bebida.preco
    end
  end

  def addresspick
    @user = current_user

    # Se um endereco ja foi selecionado para esse carrinho, pular a etapa de selecionar endereco
    redirect_to checkout_path if params[:possuiendereco] == "false"

    @enderecos = @user.enderecos.select {|endereco| endereco.status == true}

    @temendereco = @enderecos.length != 0
  end
end
