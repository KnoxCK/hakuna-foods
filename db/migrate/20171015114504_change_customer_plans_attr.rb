class ChangeCustomerPlansAttr < ActiveRecord::Migration[5.0]
  def change
    change_column :customer_plans, :days_per_week, :integer, default: 5
  end
end
