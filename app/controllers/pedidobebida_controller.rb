class PedidobebidaController < ApplicationController

  def create

    b = Pedidobebida.new
    b.bebida = params[:bebida]
    b.pedido = current_user.pedidos.select { |pedido| pedido.status = 'em compras'}[0]
    b.quantidade = params[:bebidaquantidade]
    preco_unitario = Bebida.find_by(nome: b.bebida).preco_base
    b.preco = preco_unitario * b.quantidade
    b.save

    redirect_to cardapio_path
  end

  def destroy
    b = Pedidobebida.find(params[:id])
    b.destroy

    redirect_to cardapio_path
  end
end
