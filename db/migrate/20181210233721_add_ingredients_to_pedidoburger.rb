class AddIngredientsToPedidoburger < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidoburgers, :ingredientes, :string, array: true, default: []
    add_column :pedidoburgers, :quantidades, :string, array: true, default: []
  end
end
