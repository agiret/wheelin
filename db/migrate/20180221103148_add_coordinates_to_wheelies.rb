class AddCoordinatesToWheelies < ActiveRecord::Migration[5.1]
  def change
    add_column :wheelies, :latitude, :float
    add_column :wheelies, :longitude, :float
  end
end
