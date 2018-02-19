class Booking < ApplicationRecord
  belongs_to :wheely
  belongs_to :user
end
