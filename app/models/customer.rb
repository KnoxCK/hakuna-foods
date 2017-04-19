class Customer < ApplicationRecord

  has_one :address, dependent: :destroy
  has_many :meal_plan_items
  has_many :orders, through: :meal_plan_items

end
