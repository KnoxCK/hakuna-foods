class AddHalfPrices < ActiveRecord::Migration[5.0]
  def change
    MealPlan.where(name: 'Maintain').update(half_daily_price: 21)
    MealPlan.where(name: 'Train').update(half_daily_price: 22)
    MealPlan.where(name: 'Trim').update(half_daily_price: 20)
    MealPlan.where(name: 'Postnatal').update(half_daily_price: 21
    MealPlan.where(name: 'Plant Based').update(half_daily_price: 19
  end
end
