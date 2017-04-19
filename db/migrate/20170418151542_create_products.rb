class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :daily_price
      t.references :category, index: true, foreign_key: true
      t.text :description
      t.text :detailed_description
      t.timestamps
    end
  end
end
