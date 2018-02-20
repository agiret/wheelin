class Wheely < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings

  validates :address, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
end
