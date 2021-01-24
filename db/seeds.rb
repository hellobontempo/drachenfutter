# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'api.rb'

#admin = User.create(name:"Admin", email:"admin@me.com", username: "admin", password:"123")


100.times do
    create_random_recipe
end


# user1 = User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, username: "livelaughlove2020", password: "123password")
# user2 = User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, username:  "truecook9823", password: "123password")
# user3 = User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, username:  "lovinoven", password: "123password")
# user4 = User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, username:  "forkgetaboutit", password: "123password")
# user5 = User.create(name: Faker::Name.first_name , email: Faker::Internet.unique.email, username:  "carbonator99", password: "123password")

# recipe1 = Recipe.find_by_id(1)
# recipe2 = Recipe.find_by_id(2)
# recipe3 = Recipe.find_by_id(3)
# recipe4 = Recipe.find_by_id(4)
# recipe5 = Recipe.find_by_id(5)
# recipe6 = Recipe.find_by_id(6)
# recipe7 = Recipe.find_by_id(7)
# recipe8 = Recipe.find_by_id(8)
# recipe9 = Recipe.find_by_id(9)
# recipe10 = Recipe.find_by_id(10)

# Review.create(user: user1, content: "So delicious!", rating: 3, recipe: recipe1)
# Review.create(user: user2, content: "It was okay, too spicy!", rating: 1, recipe: recipe1)
# Review.create(user: user3, content: "Blegh!", rating: 1, recipe: recipe1)

# Review.create(user: user4, content: "Yum!", rating: 5, recipe: recipe2)
# Review.create(user: user5, content: "My mom loves this!", rating: 4, recipe: recipe2)
# Review.create(user: user1, content: "My boyfriend dumped me after making him this!", rating: 1, recipe: recipe2)

# Review.create(user: user4, content: "Love it!", rating: 1, recipe: recipe3, favorite: true)
# Review.create(user: user3, content: "Just incredible.", rating: 1, recipe: recipe4, favorite: true)
# Review.create(user: user2, content: "So much flavor packed inside", rating: 1, recipe: recipe5, favorite: true)
