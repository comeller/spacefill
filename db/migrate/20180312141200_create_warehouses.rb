class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :surface
      t.integer :pallets
      t.text :description
      t.integer :public_price
      t.boolean :food_grade_certified
      t.boolean :frozen_certified
      t.boolean :alcohol_certified
      t.boolean :fullfilment_services
      t.boolean :transportation_services
      t.boolean :devaning_services

      t.timestamps
    end
  end
end
