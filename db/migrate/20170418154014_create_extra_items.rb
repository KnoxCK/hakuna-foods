class CreateExtraItems < ActiveRecord::Migration[5.0]
  def change
    create_table :extra_items do |t|
      t.references :customer_plan, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity_per_week
      t.float :monthly_price

      t.timestamps
    end
  end
end
