class AddColumnValidToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :valid_postcode, :boolean
  end
end
