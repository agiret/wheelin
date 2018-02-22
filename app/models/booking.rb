class Booking < ApplicationRecord
  belongs_to :wheely
  belongs_to :user

  validates :booking_date, presence: true
  validates :wheely_id, presence: true
  validates_uniqueness_of :booking_date, scope: [:wheely_id]
end
