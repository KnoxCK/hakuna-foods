class PromoCode < ApplicationRecord
  validates_presence_of :code, :discount
end
