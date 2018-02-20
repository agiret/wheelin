class AddTitleToWheelies < ActiveRecord::Migration[5.1]
  def change
    add_column :wheelies, :title, :string
  end
end
