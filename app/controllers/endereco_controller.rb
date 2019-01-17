class EnderecoController < ApplicationController

  def index
    @user = current_user

    # Se um endereco ja foi selecionado para esse carrinho, pular a etapa de selecionar endereco
    redirect_to checkout_path if params[:possuiendereco] == "false"

    @enderecos = @user.enderecos.select {|endereco| endereco.status == true}

    @temendereco = @enderecos.length != 0
  end


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
    # The address does not get destroyed. It simply becomes unactive, so previous orders
    # with that address don't get corrupted
    endereco = Endereco.find(params[:id])
    enderecoid = endereco.id

    endereco.status = false

    endereco.save

    # Retirar enderecoid do pedido caso o usuario exclua o endereco que esta sendo usado para entrega (anti-bug)
    carrinho = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'em compras'}
    carrinho[0].enderecoid = nil
    carrinho[0].save

    redirect_to addresspick_path
  end
end
