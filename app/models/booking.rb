class Booking < ApplicationRecord
  belongs_to :wheely
  belongs_to :user

  validates :booking_day, prensence: true
  validates :wheely_id, prensence: true
  validates_uniqueness_of :booking_day, scope: [:wheely_id]
end
