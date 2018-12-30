class AddCidadeToEndereco < ActiveRecord::Migration[5.2]
  def change
    add_column :enderecos, :cidade, :string
    add_column :enderecos, :estado, :string
  end
end
