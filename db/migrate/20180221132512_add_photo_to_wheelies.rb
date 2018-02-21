class AddPhotoToWheelies < ActiveRecord::Migration[5.1]
  def change
    add_column :wheelies, :photo, :string
  end
end
