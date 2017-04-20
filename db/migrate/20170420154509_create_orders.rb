class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :sku
      t.string :customer
      t.string :plan
      t.json :payment
      t.string :state
      t.references :meal_plan, index: true, foreign_key: true
      t.timestamps
    end
  end
end
