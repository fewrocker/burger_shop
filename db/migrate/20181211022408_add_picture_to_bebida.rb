class AddPictureToBebida < ActiveRecord::Migration[5.2]
  def change
    add_column :bebidas, :picture_url, :string
  end
end
