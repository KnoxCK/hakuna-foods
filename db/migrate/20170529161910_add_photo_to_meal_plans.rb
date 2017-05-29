class AddPhotoToMealPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :meal_plans, :photo, :string
  end
end
