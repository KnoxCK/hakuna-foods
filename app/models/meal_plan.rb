class MealPlan < ApplicationRecord

has_many :customer_plans

monetize :daily_price_pennies

end
