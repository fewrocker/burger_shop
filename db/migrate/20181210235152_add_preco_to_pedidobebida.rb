class AddPrecoToPedidobebida < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidobebidas, :preco, :decimal
  end
end
