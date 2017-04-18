class AddColumnToMealPlans < ActiveRecord::Migration[5.0]
  def change
    add_reference :meal_plans, :order, index: true
  end
end
