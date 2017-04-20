class ExtraItem < ApplicationRecord
  belongs_to :customer
  has_one :product
  belongs_to :customer_plan
end
