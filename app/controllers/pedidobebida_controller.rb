class PedidobebidaController < ApplicationController

  def create

    b = Pedidobebida.new
    b.bebida = params[:bebida]
    b.pedido = current_user.pedidos.select { |pedido| pedido.status == 'em compras'}[0]

    b.quantidade = params[:bebidaquantidade]

    # Checar se ja existe um pedido para essa bebida. Caso positivo, juntar os dois pedidos
    # ob representa o array de outras bebidas do mesmo pedido e mesmo nome usado para checar se ha repetido
    ob = Pedidobebida.all.select { |outra| outra.pedido == b.pedido && outra.bebida == b.bebida }
    if ob.length == 1
      b.quantidade += ob[0].quantidade
      ob[0].destroy
    end

    preco_unitario = Bebida.find_by(nome: b.bebida).preco_base
    b.preco = preco_unitario * b.quantidade
    b.save

    redirect_to cardapio_path
  end

  def destroy
    b = Pedidobebida.find(params[:id])
    b.destroy

    redir = params[:redir]

    if redir == "checkout"
      redirect_to checkout_path
    else
      redirect_to cardapio_path
    end
  end
end
