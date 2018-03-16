class WarehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query_localisation].present?
      # sql_query = "address ILIKE :query_localisation and latitude is not null and longitude is not null"
      # @warehouses = Warehouse.where(sql_query, query_localisation: "%#{params[:query_localisation]}%")
      @warehouses = Warehouse.near(params[:query_localisation], 50)
      @warehouses = Warehouse.where.not(latitude: nil, longitude: nil) if @warehouses.first.nil?
    else
      @warehouses = Warehouse.where.not(latitude: nil, longitude: nil)
    end

    if params[:surface].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.surface < params[:surface].to_i}
    end
    if params[:pallets].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.pallets < params[:pallets].to_i}
    end
    if params[:public_price].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.public_price > params[:public_price].to_i}
    end

    if params[:food_grade_certified].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.food_grade_certified == false}
    end
    if params[:alcohol_certified].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.alcohol_certified == false}
    end
    if params[:frozen_certified].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.frozen_certified == false}
    end
    if params[:fulfillment_services].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.fulfillment_services == false}
    end
    if params[:transportation_services].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.transportation_services == false}
    end
    if params[:devanning_services].present?
      @warehouses = @warehouses.reject {|warehouse| warehouse.devanning_services == false}
    end

    @markers = @warehouses.map do |warehouse|
      {
        lat: warehouse.latitude,
        lng: warehouse.longitude,
        # Icons: comment to come back to google red pins
        icon: 'http://res.cloudinary.com/dixy9tipv/image/upload/c_scale,h_50/v1520948069/152094739257384144.png',
        infoWindow: { content: render_to_string(partial: "map_box", locals: { warehouse: warehouse }) }
      }
    end

    respond_to do |format|
      format.html {render 'index'}
      format.js
    end

  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @booking = Booking.new
    @markers = [{
        lat: @warehouse.latitude,
        lng: @warehouse.longitude,
        # Icons: comment to come back to google red pins
        icon: 'http://res.cloudinary.com/dixy9tipv/image/upload/c_scale,h_50/v1520948069/152094739257384144.png',
      }]
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

  def edit
    @warehouse = Warehouse.find(params[:id])
    authorize @warehouse
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    authorize @warehouse
    @warehouse.update(warehouse_params)
    flash[:notice] = 'Your warehouse is updated !'
    redirect_to warehouse_path(@warehouse)
  end

  def manage_your_space
    @warehouses = current_user.warehouses
    # @warehouse = @warehouses.first
    # @data_warehouse = @warehouse.create_chart_data
    authorize :warehouse
  end



  private

  def warehouse_params
    params.require(:warehouse).permit(:address, :surface, :pallets, :description,
     :public_price, :food_grade_certified, :frozen_certified, :alcohol_certified,
     :fulfillment_services, :transportation_services, :devanning_services, :photo)
  end
end
