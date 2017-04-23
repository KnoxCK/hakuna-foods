class ExtraItem < ApplicationRecord
  has_one :extra
  belongs_to :customer_plan
end
