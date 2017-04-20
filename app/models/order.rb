class Order < ApplicationRecord
  belongs_to :customer, through: :meal_plan
  has_one :meal_plan
end
