class BookingsController < ApplicationController

  def my_bookings
    @bookings = Booking.all
    # @bookings = Booking.where(user: current_user)
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

  private

  def booking_params
    params.require(:booking).permit(:booked_pallets, :customer_request)
  end

end
