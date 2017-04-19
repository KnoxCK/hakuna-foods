class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :postcode
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.integer :height
      t.integer :weight
      t.integer :exercise
      t.string :occupation
      t.string :allergies
      t.string :preferences
      t.string :phone
      t.string :stripe_customer_id
      t.timestamps
    end
  end
end
