class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
    @booking = Booking.new
  end
end
