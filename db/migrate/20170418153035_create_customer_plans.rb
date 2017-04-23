class CreateCustomerPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_plans do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :meal_plan, index: true, foreign_key: true
      t.integer :days_per_week
      t.float :total_price
      t.boolean :subscription
    end
  end
end
