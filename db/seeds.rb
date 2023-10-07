# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

category = ["chinese", "italian", "japanese", "french", "belgian"]

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
10.times do
  attributes = {
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: category.sample
  }
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts 'Finished!'

puts 'Creating reviews...'
5.times do
  attributes = {
    rating: Faker::Number.between(from: 0, to: 5),
    content: Faker::Restaurant.review
  }
  Review.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts 'Finished!'
