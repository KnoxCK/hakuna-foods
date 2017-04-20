class CustomerPlan < ApplicationRecord
  belongs_to :customer
  has_one :order
  has_many :extra_items
  has_many :products, through: :extra_items
  has_one :meal_plan, :class_name => 'Product', :foreign_key => 'meal_plan_id'

end