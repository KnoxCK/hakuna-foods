class AddPromoCodeToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_plans, :promo_code, :string
  end
end
