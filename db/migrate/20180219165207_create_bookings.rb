class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :wheely, foreign_key: true
      t.references :user, foreign_key: true
      t.date :booking_date

      t.timestamps
    end
  end
end
