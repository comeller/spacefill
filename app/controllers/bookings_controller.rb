class BookingsController < ApplicationController

  def my_bookings
    @bookings = Booking.where(user: current_user).order(created_at: :desc)
    authorize :booking
  end

  # def new
    # @booking = Booking.new
    # authorize @booking
  # end

  def create
    @booking = Booking.new(booking_params)
    @warehouse = Warehouse.find(params[:warehouse_id])
    @booking.user = current_user
    @booking.warehouse = @warehouse
    authorize @booking
    if @booking.save
      redirect_to my_bookings_bookings_path
    else
      render :new
    end
  end


  def cancel
    @booking = Booking.find(params[:id])
    @booking.status = 'canceled'
    @booking.save
    authorize @booking
    respond_to do |format|
      format.html { redirect_to my_bookings_bookings_path }
      format.js
    end
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    @booking.save
    authorize @booking
    redirect_to manage_your_space_warehouses_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "refused"
    @booking.save
    authorize @booking
    redirect_to manage_your_space_warehouses_path
  end

  private

  def booking_params
    params.require(:booking).permit(:booked_pallets, :customer_request, :start_date)
  end

end
