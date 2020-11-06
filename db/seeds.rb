# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying everything..."
Cocktail.destroy_all
Ingredient.destroy_all

puts "Creating ingredients from the remote URL..."

response = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(response, symbolize_names: true)

# {
#   "drinks":[
#     {
#       "strIngredient1":"Light rum"
#     }
#   ]
# }


json[:drinks].each do |drink|
  name = drink[:strIngredient1]
  
  puts "+ #{name}"

  Ingredient.create!(name: name)
end

puts "Done"

