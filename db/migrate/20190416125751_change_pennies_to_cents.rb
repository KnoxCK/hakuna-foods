class ChangePenniesToCents < ActiveRecord::Migration[5.2]
  def change
    rename_column :extra_items, :weekly_price_pennies, :weekly_price_cents
    rename_column :extras, :unit_price_pennies, :unit_price_cents
    rename_column :customer_plans, :total_price_pennies, :total_price_cents
    rename_column :meal_plans, :daily_price_pennies, :daily_price_cents
    rename_column :meal_plans, :half_daily_price_pennies, :half_daily_price_cents
    rename_column :orders, :total_price_pennies, :total_price_cents
  end
end
