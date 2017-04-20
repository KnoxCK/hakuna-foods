class ExtraItem < ApplicationRecord
  belongs_to :customer, through: :customer_plan
  has_one :product
  belongs_to :customer_plan
end
