class CreateAddressesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :postcode
      t.text :delivery_instructions
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
