class ChangeColumnPromoCodeOnCustomerPlans < ActiveRecord::Migration[5.0]
  def change
    remove_column :customer_plans, :promo_code
    add_reference :customer_plans, :promo_code, foreign_key: true, index: true
  end
end
