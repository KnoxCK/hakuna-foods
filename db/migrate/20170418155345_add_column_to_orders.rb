class AddColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total_amount, :integer
  end
end
