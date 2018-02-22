# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'
require 'nokogiri'

url = "https://fr.wikipedia.org/wiki/Liste_des_rues,_places_et_ponts_de_Lyon"

puts "1"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
RUES = []
html_doc.search('.colonnes ul li a').each do |rue|
  RUES << rue.text
end

puts "2"

Wheely.destroy_all
Category.destroy_all
User.destroy_all

# CATEGORIES = ["Bike", "Carriage", "Quadricycle", "Roller", "Scooter", "Segway", "Skateboard", "Tandem", "Unicycle", "Wheelbarrow"]
CAT = []

CATEGORIES = {
  "Bike" => "http://fixiedesign.com/images/stories/virtuemart/product/fixie-single-speed-vert.jpg",
  "Bike" => "http://fixiedesign.com/images/stories/virtuemart/product/fixie-single-speed-vert.jpg",
  "Bike" => "http://fixiedesign.com/images/stories/virtuemart/product/fixie-single-speed-vert.jpg",
  "Carriage" => "http://mypnglc.com/wp-content/uploads/2013/08/carriage.jpg",
  "Quadricycle" => "https://sc01.alicdn.com/kf/HTB1HELJXPihSKJjy0Flq6ydEXXaY/202528612/HTB1HELJXPihSKJjy0Flq6ydEXXaY.jpg",
  "Roller" => "https://i2.cdscdn.com/pdt2/l/3/8/1/700x700/csl102sl38/rw/cdts-patins-a-roulettes-disco-taille-38-39.jpg",
  "Scooter" => "https://i2.cdscdn.com/pdt2/2/7/3/1/700x700/auc5203068501273/rw/princesse-sofia-trottinette-3-roues-enfant-fille.jpg",
  "Segway" => "https://www.ornicom.fr/wp-content/uploads/2014/03/achat-vente-location-gyropode-segway-neuf-occasion.jpg",
  "Skateboard" => "http://landyachtz.com/media/catalog/product/cache/2/image/1800x/040ec09b1e35df139433887a97daa66f/r/e/revival-ruby-lake-landyachtz-reclaimed-cruiser-board-longboard-skateboard-02.jpg",
  "Tandem" => "https://www.amsterdamer.fr/26738-large_default/kit-assistance-electrique-velo-tandem-capacite-375-a-1220-wh.jpg",
  "Unicycle" => "https://www.impactunicycles.com/wp-content/uploads/2017/06/uni19Gravity.jpg",
  "Wheelbarrow" => "https://i.ebayimg.com/thumbs/images/g/XQoAAOSwax5YqtZA/s-l225.jpg"
}

puts "3"

CATEGORIES.each do |category, lien|
  cat = Category.create!(name: category)
  CAT << cat
end

puts "4"

2.times do |i|
  user = User.create!(email: "user#{i}@user.fr", password: "azertyuiop")
  20.times do
    category = CAT.sample
    Wheely.create!(
      title: category.name,
      category: category,
      user: user,
      address: "#{RUES.sample}, Lyon, France",
      description: Faker::Simpsons.quote,
      price: (10..50).to_a.sample,
      remote_photo_url: CATEGORIES[category.name]
    )
  end
end

puts "finish"
