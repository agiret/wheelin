class AddPriceToWheelies < ActiveRecord::Migration[5.1]
  def change
    add_column :wheelies, :price, :integer
  end
end
