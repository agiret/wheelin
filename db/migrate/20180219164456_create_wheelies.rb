class CreateWheelies < ActiveRecord::Migration[5.1]
  def change
    create_table :wheelies do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
