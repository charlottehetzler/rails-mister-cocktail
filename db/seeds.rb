require 'json'
require 'open-uri'

puts 'destroying ingredients'
Ingredient.destroy_all

puts 'starting json'
serialized_drink = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
drinks = JSON.parse(serialized_drink)
drinks['drinks'].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
puts '3 more'

Ingredient.create(name: 'lemon')
Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')

Cocktail.create(name: 'Campari Orange', photo: '../app/assets/images/cocktail_CampariOrange.jpg')

puts 'done'

# require 'json'
# require 'open-uri'

# url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients_serialized = open(url).read
# ingredients = JSON.parse(ingredients_serialized)
# cocktails = ["Gin", "Mojito", "Happy", "Whiskey", "Spritz", "Vodka", "Strawberry", "SuperGin"]

# puts "seeding starts"

# Cocktail.destroy_all
# Ingredient.destroy_all

# cocktails.each do |cocktail|
#   drink = Cocktail.new(name: cocktail)

#   if drink.save
#     puts "#{drink.name} saved"
#   end
# end
# # 5.times do
# #   drink = Cocktail.new(name: Faker::BossaNova.song)

# #   if drink.save
# #     puts "#{drink.name} saved"
# #   end
# # end

# ingredients["drinks"].each do |ingredient|
#   ing = Ingredient.new(name: ingredient["strIngredient1"])

#   if ing.save
#     puts "#{ing.name} saved"
#   end
# end

# puts "seeding finished"
