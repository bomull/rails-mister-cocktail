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
# p(ingredients.flatten.map { |x| x.values })

ingredients['drinks'].each do |i|
  # p i
  ing = Ingredient.new(name: i["strIngredient1"])
  # p i["strIngredient1"]
  ing.save!
end

puts 'Created new records'

puts 'destroying all cocktails'
Cocktail.destroy_all
puts 'destroyed all cocktails'

puts 'creating new cocktails'
p Dir.pwd

counter = 0
images = Dir.entries('app/assets/images')[2..-1]
p images.sample
p images.sample
p images.sample
p images.sample
p images.sample
p images.sample
p images.sample
p images.sample
p images.sample
p images.sample

rand(15..25).times do
  Cocktail.create(name: "The #{Faker::Hipster.unique.word.capitalize}", image: "#{images.sample}")
  counter += 1
end
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
# Cocktail.create(name: "The #{Faker::Hipster.unique.word}")
puts 'created some new cocktails'

units = ["ml", "cl", "dl", "liters", "sprinkles", "dashes", "spoonfuls"]
# amounts = [2, 3, 4, 5, 6, "enough", "lots", "a bunch"]
cocktail = Cocktail.all

puts 'creating new doses'
counter.times do |n|
  rand(2..7).times do
    Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[n])
  end
end


# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.first)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.first)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.first)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.second)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.second)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.second)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.third)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.third)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.third)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.fourth)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.fourth)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.fourth)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.fourth)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.fifth)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: Cocktail.fifth)
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[6])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[6])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[6])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[7])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[7])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[7])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[7])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[7])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[7])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[8])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[8])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[8])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[8])
# Dose.create(description: "#{rand(2..6)} #{units.sample}", ingredient: Ingredient.order("RANDOM()").first, cocktail: cocktail[8])


puts 'created new doses'
