class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :address, presence: true
  validates :surface, presence: true, numericality: { only_integer: true }
  validates :pallets, presence: true, numericality: { only_integer: true }
  validates :public_price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  def create_chart_data
    data_warehouse = [
      ['Month', 'Booked', 'Pending']
    ]
    month = Time.now.beginning_of_month
    months = %w(Jan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec)
    until month == Time.now.beginning_of_month + 12.months
      bookings = self.bookings.where("start_date < :end", end: month.end_of_month)
      data_warehouse << [months[month.month-1], bookings.where(status: "approved").inject(0){ |sum, booking| sum += booking.booked_pallets }, bookings.where(status: "pending").inject(0){ |sum, booking| sum += booking.booked_pallets }]
      month = month.next_month
    end
    data_warehouse
  end
end
