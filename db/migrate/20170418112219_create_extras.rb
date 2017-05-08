class CreateExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :extras do |t|
      t.string :name
      t.float :unit_price
      t.text :description
    end
  end
end
