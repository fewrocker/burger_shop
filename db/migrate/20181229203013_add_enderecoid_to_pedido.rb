class AddEnderecoidToPedido < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :enderecoid, :integer
  end
end
