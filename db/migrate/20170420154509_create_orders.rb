class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :customer
      t.integer :total_amount
      t.json :payment
      t.string :state
      t.references :customer_plan, index: true, foreign_key: true
      t.timestamps
    end
  end
end
