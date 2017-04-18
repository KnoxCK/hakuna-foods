# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Product.destroy_all
User.destroy_all

User.create(email: 'guv@test.com', password: '123456')

Category.create!(name: 'Meal Plans')
Category.create!(name: 'Extras')

Product.create!(name: 'Maintain', sku: "maintain-monthly-plan", daily_price: 39, category: 1)
Product.create!(name: 'Train', sku: "train-monthly-plan", daily_price: 41, category: 1)
Product.create!(name: 'Trim', sku: "trim-monthly-plan", daily_price: 36, category: 1)
Product.create!(name: 'Postnatal', sku: "postnatal-monthly-plan", daily_price: 39, category: 1)
Product.create!(name: 'Vegetarian', sku: "vegetarian-monthly-plan", daily_price: 39, category: 1)
Product.create!(name: 'Bespoke', sku: "bespoke-monthly-plan", daily_price: 0, category: 1)

Product.create!(name: 'Kombucha', sku: "kombucha-extra", daily_price: 2.5, category: 2)
Product.create!(name: 'Cold Press Coffee', sku: "coffee-extra", daily_price: 2.5, category: 2)
Product.create!(name: 'Sweet Treat', sku: "sweet-extra", daily_price: 2.5, category: 2)
