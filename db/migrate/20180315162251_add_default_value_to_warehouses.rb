class AddDefaultValueToWarehouses < ActiveRecord::Migration[5.1]
  def change
    change_column :warehouses, :food_grade_certified, :boolean, default: false
    change_column :warehouses, :frozen_certified, :boolean, default: false
    change_column :warehouses, :alcohol_certified, :boolean, default: false
    change_column :warehouses, :fulfillment_services, :boolean, default: false
    change_column :warehouses, :transportation_services, :boolean, default: false
    change_column :warehouses, :devanning_services, :boolean, default: false
  end
end
