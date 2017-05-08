class CreateMealPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_plans do |t|
      t.string :name
      t.float :daily_price
      t.text :description
      t.text :detailed_description
      t.timestamps
    end
  end
end
