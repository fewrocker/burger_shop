class PedidoController < ApplicationController

  def index
    # Os pedidos sao alterados de status automaticamente
    # Depois de 15 minutos, passam de em preparo para saiu para entrega
    # Depois de 15 minutos, passam de saiu para  entrega para concluido

    Pedido.all.select {|pedido| pedido.status == 'em preparo' || pedido.status == 'saiu para entrega' }.each do |pedido|
      timeelapsed = ((Time.now - pedido.horario)/60).round(0)

      if timeelapsed > 15 && timeelapsed <= 30
        pedido.status = 'saiu para entrega'
        pedido.save
      elsif timeelapsed > 30
        pedido.status = 'concluido'
        pedido.save
      end
    end

    if !current_user.admin
      @pedido_show_type = 'user'
      @pedidos_em_andamento = Pedido.all.select { |pedido| pedido.user == current_user && (pedido.status == 'em preparo' || pedido.status == 'saiu para entrega') }
      @pedidos_concluidos = Pedido.all.select { |pedido| pedido.user == current_user && pedido.status == 'concluido'}
    else
      @pedido_show_type = 'admin'
      @pedidos_em_preparo = Pedido.all.select { |pedido| pedido.status == 'em preparo' }
      @pedidos_saiu_para_entrega = Pedido.all.select { |pedido| pedido.status == 'saiu para entrega' }
    end

  end

  def show
  end

  def update
    pedido = Pedido.find(params[:id])

    if params[:order] == 'concluir'
      pedido.status = 'em preparo'
      pedido.precototal = params[:precototal].to_f
      pedido.horario = Time.now
      pedido.save

      redirect_to cardapio_path
    end
  end
end
