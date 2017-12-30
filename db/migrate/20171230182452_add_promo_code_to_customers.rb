class AddPromoCodeToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :promo_code, :string
  end
end
