class CreateExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :extras do |t|
      t.references :user, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity_per_week
      t.integer :monthly_price

      t.timestamps
    end
  end
end
