class ChangeFullfilmentServicesToFulfillmentServicesInWarehouses < ActiveRecord::Migration[5.1]
  def change
    rename_column :warehouses, :fullfilment_services, :fulfillment_services
  end
end
