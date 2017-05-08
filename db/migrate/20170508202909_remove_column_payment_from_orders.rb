class RemoveColumnPaymentFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :payment
    remove_column :orders, :customer
  end
end
