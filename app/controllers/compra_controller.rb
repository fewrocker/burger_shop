class CompraController < ApplicationController

  def cardapio
    # Criar um carrinho caso o usuario nao tenha um carrinho aberto
    if current_user.pedidos.select { |pedido| pedido.status == 'em compras'}.length == 0
      p = Pedido.new
      p.user = current_user
      p.endereco = ''
      p.status = 'em compras'
      p.save
    end

    @lanches = Burger.all
    @bebidas_soft = Bebida.all.select { |bebida| bebida.categoria == 'Soft' }
    @bebidas_cervejas = Bebida.all.select { |bebida| bebida.categoria == 'Cervejas' }

    @carrinho = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'em compras' }[0]
    @carrinho_burgers = @carrinho.pedidoburgers
    @carrinho_bebidas = @carrinho.pedidobebidas

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

    @carrinho_total = 0
    @carrinho_burgers.each do |burger|
      @carrinho_total += burger.preco
    end
    @carrinho_bebidas.each do |bebida|
      @carrinho_total += bebida.preco
    end



  end




end
