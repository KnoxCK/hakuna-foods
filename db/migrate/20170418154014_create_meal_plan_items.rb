class CreateMealPlanItems < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_plan_items do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity_per_week
      t.integer :monthly_price

      t.timestamps
    end
  end
end