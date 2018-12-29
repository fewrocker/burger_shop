class AddPictureToBurger < ActiveRecord::Migration[5.2]
  def change
    add_column :burgers, :picture_url, :string
  end
end
