class AddPrecoToPedidoburger < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidoburgers, :preco, :decimal
  end
end
