class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :warehouse
  validates :status, inclusion: { in: %w(pending approved refused ended) }
end
