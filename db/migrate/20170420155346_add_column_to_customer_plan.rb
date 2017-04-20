class AddColumnToCustomerPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_plans, :days_per_week, :integer
  end
end
