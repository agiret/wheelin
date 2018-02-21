class Wheely < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings

  validates :address, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :user, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
