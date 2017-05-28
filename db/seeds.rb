
MealPlan.destroy_all
Extra.destroy_all
User.destroy_all

User.create!(email: "guv@test.com", password: "123456", admin: true)

MealPlan.create!(name: 'Maintain', daily_price: 39, description: 'A nourishing plan to boost energy and support optimal well being', detailed_description: 'Providing a rich source of nutrients and energy, our maintenance plan is based on a 2000kcal daily intake. Packed full of wholefoods and lean protein, this packet is perfect for those who would like to begin or maintain a healthy diet.')
MealPlan.create!(name: 'Train', daily_price: 41, description: 'A higher protein plan for very active people', detailed_description: 'To support your workouts we help you focus on gaining lean muscle mass, reducing body fat and fuelling your body for optimal training. Our training plan is designed around a 2500kcal daily intake, with an increased level of protein.')
MealPlan.create!(name: 'Trim', daily_price: 36, description: 'A fat busting plan to aid towards weight loss', detailed_description: 'This is a lifestyle change programme rather than quick fix diet. It helps you take control of your food intake which will put you in the best position to hit your fat loss targets. Our daily meal plans are designed around a 1500kcal daily intake to keep you feeling fuller for longer whilst stabilizing your blood sugars and providing all the nutrients you need to stay healthy and well.')
MealPlan.create!(name: 'Postnatal', daily_price: 39, description: 'A healthy, balanced plan to give time, energy and nourishment to new mums', detailed_description: 'Our postnatal plan provides a healthy and balanced diet which is so important to new mums. Providing a daily intake of 2200kcal, with a focus on energy rich, nutrient dense foods, our plan helps lighten the stress of having a baby and gives you much needed time to spend with your little ones.')
MealPlan.create!(name: 'Vegetarian and Vegan', daily_price: 39, description: 'A plant based plan in accordance with one of our other plans', detailed_description: 'A plant based plan which provides a nourishing and balanced diet, consisting of wholegrains, slow energy release carbohydrates, healthy fats and plant based proteins.')
MealPlan.create!(name: 'Bespoke', daily_price: 0, description: 'We can provide meals directly in line with personal requirements', detailed_description: 'Know your macros and calorie guidelines? Or want us to calculate them for you? We can provide meals directly in line with personal requirements. Or, if you have a focused diet plan in mind, we can help tailor a plan for you. Please email us at info@hakunafoods.co.uk for a telephone consultation for further information.')

Extra.create!(name: 'Kombucha', unit_price: 2.5)
Extra.create!(name: 'Cold Press Coffee',  unit_price: 2.5)
Extra.create!(name: 'Sweet Treat', unit_price: 2.5)
