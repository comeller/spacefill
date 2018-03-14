class BookingsController < ApplicationController

  def my_bookings
    @bookings = Booking.all
    # @bookings = Booking.where(user: current_user)
    authorize :booking
  end
end
