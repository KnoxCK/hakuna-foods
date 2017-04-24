

MealPlan.destroy_all
Extra.destroy_all

MealPlan.create!(name: 'Maintain', sku: "maintain-monthly-plan", daily_price: 39)
MealPlan.create!(name: 'Train', sku: "train-monthly-plan", daily_price: 41)
MealPlan.create!(name: 'Trim', sku: "trim-monthly-plan", daily_price: 36)
MealPlan.create!(name: 'Postnatal', sku: "postnatal-monthly-plan", daily_price: 39)
MealPlan.create!(name: 'Vegetarian', sku: "vegetarian-monthly-plan", daily_price: 39)
MealPlan.create!(name: 'Bespoke', sku: "bespoke-monthly-plan", daily_price: 0)

Extra.create!(name: 'Kombucha', sku: "kombucha-extra", unit_price: 2.5)
Extra.create!(name: 'Cold Press Coffee', sku: "coffee-extra", unit_price: 2.5)
Extra.create!(name: 'Sweet Treat', sku: "sweet-extra", unit_price: 2.5)
