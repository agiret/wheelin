class Wheely < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings

  validates :address, prensence: true
  validates :description, prensence: true
  validates :category_id, prensence: true
end
