class Order < ApplicationRecord
  belongs_to :customer, through: :meal_plan_items
  has_many :meal_plan_items
  has_many :products, through: :meal_plan_items
end
