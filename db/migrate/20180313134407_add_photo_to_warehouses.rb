class AddPhotoToWarehouses < ActiveRecord::Migration[5.1]
  def change
    add_column :warehouses, :photo, :string
  end
end
