class ExtraItem < ApplicationRecord
  has_one :extra
  belongs_to :customer_plan

  monetize :weekly_price_pennies

end
