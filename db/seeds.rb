# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Wheely.destroy_all
Category.destroy_all

CATEGORIES = ["Bike", "Carriage", "Quadricycle", "Roller", "Scooter", "Segway", "Skateboard", "Tandem", "Unicycle", "Wheelbarrow"]

CAT = []

CATEGORIES.each do |category|
  cat = Category.create!(name: category)
  CAT << cat
end

3.times do
  user = User.create!(email: Faker::Internet.email, password: "azertyuiop")
  2.times do
    cat = CAT.sample
    Wheely.create!(title: cat.name,
                  category: cat,
                  user: user,
                  address: Faker::Address.city,
                  description: Faker::Simpsons.quote,
                  price: (10..50).to_a.sample)
  end
end
