class MealPlanItem < ApplicationRecord
  belongs_to :user
  has_many :products
  has_one :order
end
