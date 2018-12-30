class AddPrecototalToPedido < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :precototal, :decimal
  end
end
