class ChangeOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :total_amount
    add_monetize :orders, :total_price, currency: { present: false }
    remove_column :extras, :unit_price
    add_monetize :extras, :unit_price, currency: { present: false }
    remove_column :meal_plans, :daily_price
    add_monetize :meal_plans, :daily_price, currency: { present: false }
    remove_column :customer_plans, :total_price
    add_monetize :customer_plans, :total_price, currency: { present: false }
    remove_column :extra_items, :weekly_price
    add_monetize :extra_items, :weekly_price, currency: { present: false }
  end
end
