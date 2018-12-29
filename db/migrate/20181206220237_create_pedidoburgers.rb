class CreatePedidoburgers < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidoburgers do |t|
      t.integer :quantidade
      t.string :burger
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end
