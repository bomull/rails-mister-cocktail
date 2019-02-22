# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

puts 'Destroying all doses'
Dose.destroy_all
puts 'Destroyed all doses'
puts 'Destroying all ingredients'
Ingredient.destroy_all
puts 'Destroyed all ingredients'

puts 'Creating records'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)


ingredients['drinks'].each do |i|
  ing = Ingredient.new(name: i["strIngredient1"])
  ing.save!
end

puts 'Created new records'

puts 'destroying all cocktails'
Cocktail.destroy_all
puts 'destroyed all cocktails'

puts 'creating new cocktails'

images = Dir.entries('app/assets/images')
images = images[2..-1]

counter = 0
rand(15..25).times do
  Cocktail.create(name: "The #{Faker::Hipster.unique.word.capitalize}", image: "#{images.sample}")
  counter += 1
end
puts 'created some new cocktails'

units = ["ml", "cl", "dl", "liters", "sprinkles", "dashes", "spoonfuls"]
cocktail = Cocktail.all

puts 'creating new doses'
counter.times do |n|
  rand(2..7).times do
    Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[n])
  end
end


puts 'created new doses'
