class AddDiscountAppliedToCustomerPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_plans, :discount_applied, :boolean, default: false
  end
end
