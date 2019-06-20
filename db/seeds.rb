url = 'https://unsplash.com/photos/lwoTuByIuC4'
cocktail = Cocktail.new(name: 'Campari Orange')
cocktail.remote_photo_url = url
cocktail.save

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



puts 'done'
