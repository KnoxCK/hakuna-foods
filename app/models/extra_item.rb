class ExtraItem < ApplicationRecord
  belongs_to :extra
  belongs_to :customer_plan

  monetize :weekly_price_pennies

end
