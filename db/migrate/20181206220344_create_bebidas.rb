class CreateBebidas < ActiveRecord::Migration[5.2]
  def change
    create_table :bebidas do |t|
      t.string :nome
      t.string :categoria
      t.string :possiveis_tamanhos, array: true, default: []

      t.timestamps
    end
  end
end
