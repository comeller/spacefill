class AddBookedPalletsColumnToTheTableBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :booked_pallets, :integer
  end
end
