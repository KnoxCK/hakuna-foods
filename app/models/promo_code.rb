class PromoCode < ApplicationRecord
  validates_presence_of :code, :discount

  def self.verify(customer_plan, promo_code)
    self.all.collect(&:code).include?(promo_code)
  end
end
