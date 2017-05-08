class Order < ApplicationRecord
  has_one :customer, through: :customer_plan
  belongs_to :customer_plan

  monetize :total_price_pennies

end
