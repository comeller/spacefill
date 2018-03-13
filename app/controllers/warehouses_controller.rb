class WarehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @warehouses = Warehouse.all
    # @warehouses = Warehouse.where.not(latitude: nil, longitude: nil)
    # @markers = @warehouses.map do |warehouse|
    #   {
    #     lat: warehouse.latitude,
    #     lng: warehouse.longitude
    #   }
    # end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @booking = Booking.new
    authorize @warehouse
  end

  def new
    @warehouse = Warehouse.new
    authorize @warehouse
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    @warehouse.user = current_user
    authorize @warehouse
    if @warehouse.save
      redirect_to warehouse_path(@warehouse)
    else
      render :new
    end
  end



  private

  def warehouse_params
    params.require(:warehouse).permit(:address, :surface, :pallets, :description,
     :public_price, :food_grade_certified, :frozen_certified, :alcohol_certified,
     :fulfillment_services, :transportation_services, :devanning_services, :photo)
  end
end
