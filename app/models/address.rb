class Address < ApplicationRecord
  belongs_to :customer
  validates_presence_of :address_line1
  validates_presence_of :postcode
end
