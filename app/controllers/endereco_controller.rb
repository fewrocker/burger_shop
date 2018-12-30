class EnderecoController < ApplicationController
  def new
  end

  def create
    user = current_user


    e = Endereco.new
    e.estado = params[:addressestado]
    e.cidade = params[:addresscidade]
    e.rua = params[:addressrua]
    e.numero = params[:addressnumero].to_i
    e.comp = params[:addresscomplemento]
    e.referencia = params[:addressreferencia]
    e.user = current_user

    e.save

    redirect_to addresspick_path
  end

  def setendereco
    pedido = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'em compras' }[0]
    pedido.enderecoid = params[:enderecoid]
    pedido.save

    redirect_to checkout_path
  end

  def destroy
    endereco = Endereco.find(params[:id])
    enderecoid = endereco.id

    endereco.destroy

    # Retirar enderecoid do pedido caso o usuario exclua o endereco que esta sendo usado para entrega (anti-bug)
    carrinho = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'em compras' && pedido.enderecoid == enderecoid}
    carrinho[0].enderecoid = nil if carrinho.length != 0
    carrinho[0].save

    redirect_to addresspick_path
  end
end
