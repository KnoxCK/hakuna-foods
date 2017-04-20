class ExtraItem < ApplicationRecord
  has_one :product
  belongs_to :customer_plan
end
