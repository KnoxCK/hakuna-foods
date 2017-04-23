class CreateExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :extras do |t|
      t.string :name
      t.string :sku
      t.integer :unit_price
      t.text :description
    end
  end
end
