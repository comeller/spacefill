class AddCoordinatesToWarehouses < ActiveRecord::Migration[5.1]
  def change
    add_column :warehouses, :latitude, :float
    add_column :warehouses, :longitude, :float
  end
end
