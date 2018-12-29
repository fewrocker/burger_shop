class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.string :status
      t.datetime :horario
      t.integer :tempoentrega
      t.references :user, foreign_key: true
      t.string :endereco

      t.timestamps
    end
  end
end
