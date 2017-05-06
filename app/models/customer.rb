class Customer < ApplicationRecord

  has_one :address, dependent: :destroy
  has_one :customer_plan
  has_many :orders, through: :meal_plan_items

  def check_postcode(postcode)
    valid_postcodes = ['SW6', 'SW19']
    valid_postcodes.include?(postcode.upcase)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def formatted_dob
    self.dob.strftime("%d %B %Y")
  end

end
