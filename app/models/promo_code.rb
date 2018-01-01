class PromoCode < ApplicationRecord
  has_many :customer_plans

  validates_presence_of :code, :discount

  def self.verify(customer_plan_id, promo_code)
    set_verified(customer_plan_id, promo_code) if all.collect(&:code).include?(promo_code)
  end

  def self.set_verified(customer_plan_id, promo_code)
    CustomerPlan.find(customer_plan_id.to_i).update(promo_code_id: PromoCode.find_by_code(promo_code).id, promo_verified: true)
  end
end
