class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :customer_request
      t.float :booking_price
      t.string :status

      t.timestamps
    end
  end
end
