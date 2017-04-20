class CreateCustomerPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_plans do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :meal_plan, foreign_key: {to_table: :products}
      t.float :total_price
      t.boolean :subscription
    end
  end
end
