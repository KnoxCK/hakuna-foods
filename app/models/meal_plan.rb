class MealPlan < ApplicationRecord
  has_many :meal_plan_items
  belongs_to :customer
  has_many :products, through: :meal_plan_items

  def days_per_week
  end
end
