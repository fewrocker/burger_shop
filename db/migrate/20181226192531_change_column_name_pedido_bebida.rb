class ChangeColumnNamePedidoBebida < ActiveRecord::Migration[5.2]
  def change
    rename_column :pedidobebidas, :tamanho, :bebida
  end
end
