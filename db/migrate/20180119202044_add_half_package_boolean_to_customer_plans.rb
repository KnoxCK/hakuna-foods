class AddHalfPackageBooleanToCustomerPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_plans, :half_package, :boolean, default: false
    add_column :meal_plans, :half_daily_price_pennies, :float
  end
end
