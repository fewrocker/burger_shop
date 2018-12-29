class CreateBurgers < ActiveRecord::Migration[5.2]
  def change
    create_table :burgers do |t|
      t.string :nome
      t.string :ingredientes_base, array:true, default: []
      t.decimal :preco_base

      t.timestamps
    end
  end
end
