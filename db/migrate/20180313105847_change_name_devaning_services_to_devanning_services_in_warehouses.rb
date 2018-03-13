class ChangeNameDevaningServicesToDevanningServicesInWarehouses < ActiveRecord::Migration[5.1]
  def change
    rename_column :warehouses, :devaning_services, :devanning_services
  end
end
