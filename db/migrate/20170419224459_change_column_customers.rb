class ChangeColumnCustomers < ActiveRecord::Migration[5.0]
  def change
    change_column :customers, :exercise, :string
  end
end
