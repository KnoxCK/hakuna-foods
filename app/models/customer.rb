class Customer < ApplicationRecord

  has_one :address, dependent: :destroy
  has_many :meal_plan_items
  has_many :orders, through: :meal_plan_items

  def check_postcode(postcode)
    valid_postcodes = ['SW6', 'SW19']
    valid_postcodes.include?(postcode)
  end

end
