class MealPlanItem < ApplicationRecord
  belongs_to :customer
  has_many :products
  has_one :order
end
