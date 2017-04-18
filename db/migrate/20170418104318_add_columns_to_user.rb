class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :postcode, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :date
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :exercise, :integer
    add_column :users, :occupation, :string
    add_column :users, :allergies, :text
    add_column :users, :preferences, :text
    add_column :users, :phone, :stringg
    add_column :users, :stripe_customer_id, :string
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
