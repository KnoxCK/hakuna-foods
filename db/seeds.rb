

MealPlan.destroy_all
Extra.destroy_all
User.destroy_all

User.create!(email: "guv@test.com", password: "123456", admin: true)

MealPlan.create!(name: 'Maintain', daily_price: 39, description: '', detailed_description: '')
MealPlan.create!(name: 'Train', daily_price: 41, description: '', detailed_description: '')
MealPlan.create!(name: 'Trim', daily_price: 36, description: '', detailed_description: '')
MealPlan.create!(name: 'Postnatal', daily_price: 39, description: '', detailed_description: '')
MealPlan.create!(name: 'Vegetarian', daily_price: 39, description: '', detailed_description: '')
MealPlan.create!(name: 'Bespoke', daily_price: 0, description: '', detailed_description: '')

Extra.create!(name: 'Kombucha', unit_price: 2.5)
Extra.create!(name: 'Cold Press Coffee',  unit_price: 2.5)
Extra.create!(name: 'Sweet Treat', unit_price: 2.5)
