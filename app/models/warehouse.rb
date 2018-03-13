class Warehouse < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :surface, presence: true, numericality: { only_integer: true }
  validates :pallets, presence: true, numericality: { only_integer: true }
  validates :public_price, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader
end
