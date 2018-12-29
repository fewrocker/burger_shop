class CreatePedidobebidas < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidobebidas do |t|
      t.integer :quantidade
      t.string :tamanho
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end
