class CreateIngredientepedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredientepedidos do |t|
      t.integer :quantidade
      t.references :pedidoburgers, foreign_key: true

      t.timestamps
    end
  end
end
