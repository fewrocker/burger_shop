class AddStatusToEndereco < ActiveRecord::Migration[5.2]
  def change
    add_column :enderecos, :status, :boolean, default: true
  end
end
