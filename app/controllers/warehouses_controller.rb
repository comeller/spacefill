class WarehousesController < ApplicationController

  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @booking = Booking.new
  end
  
end
