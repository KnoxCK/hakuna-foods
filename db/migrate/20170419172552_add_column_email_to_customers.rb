class AddColumnEmailToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :email, :string, null: false
  end
end
