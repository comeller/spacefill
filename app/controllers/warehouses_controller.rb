class WarehousesController < ApplicationController

  def index
    @warehouses = Warehouse.all
    @warehouses = Warehouse.where.not(latitude: nil, longitude: nil)
    @markers = @warehouses.map do |warehouse|
      {
        lat: warehouse.latitude,
        lng: warehouse.longitude
      }
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @booking = Booking.new
  end

end
