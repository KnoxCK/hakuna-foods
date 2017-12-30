class AddPromoVerifiedToCustomerPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_plans, :promo_verified, :boolean, default: false
  end
end
