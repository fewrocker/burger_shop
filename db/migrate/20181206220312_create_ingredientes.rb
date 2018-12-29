class CreateIngredientes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredientes do |t|
      t.string :nome
      t.string :categoria
      t.decimal :preco_normal
      t.decimal :preco_extra
      t.string :possiveis_quantidades, array: true, default: []

      t.timestamps
    end
  end
end
