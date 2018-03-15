class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :warehouse
  validates :status, inclusion:{ in: ['pending', 'approved', 'rejected', 'canceled']}
end
