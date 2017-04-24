class ChangeOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :total_amount
    add_monetize :orders, :total_price, currency: { present: false }
  end
end
