class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.integer :numero
      t.string :comp
      t.string :referencia
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
