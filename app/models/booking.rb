class Booking < ApplicationRecord
  belongs_to :wheely
  belongs_to :user

  validates :booking_day, presence: true
  validates :wheely_id, presence: true
  validates_uniqueness_of :booking_day, scope: [:wheely_id]
end
