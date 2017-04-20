class CreateMealPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_plans do |t|
      t.references :meal_plan_item, index: true, foreign_key: true
      t.integer :total_price
      t.boolean :subscription
    end
  end
end