class AddPriceToBebida < ActiveRecord::Migration[5.2]
  def change
    add_column :bebidas, :preco_base, :decimal
  end
end
