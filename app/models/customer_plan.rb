class CustomerPlan < ApplicationRecord
  belongs_to :customer
  has_one :order
  has_many :extra_items
  has_many :products, through: :extra_items
  has_one :meal_plan, :class_name => 'Product', :foreign_key => 'meal_plan_id'

  def extras(params)
    unless params["Kombucha"] == "" || params["Kombucha"] == "0"
      ExtraItem.create!(product_id: Product.where(name: 'Kombucha').first.id,
        quantity_per_week: params["Kombucha"].to_i, customer_plan_id: self.id)
    end
    unless params["Cold Press Coffee"] == "" || params["Cold Press Coffee"] == "0"
      ExtraItem.create!(product_id: Product.where(name: 'Cold Press Coffee').first.id,
        quantity_per_week: params["Cold Press Coffee"].to_i, customer_plan_id: self.id)
    end
    unless params["Sweet Treat"] == "" || params["Sweet Treat"] == "0"
      ExtraItem.create!(product_id: Product.where(name: 'Sweet Treat').first.id,
        quantity_per_week: params["Sweet Treat"].to_i, customer_plan_id: self.id)
    end
  end

  def calculate_monthly_extras
    self.extra_items.each do |item|
      item.monthly_price = (Product.find(item.product_id).daily_price * item.quantity_per_week * 52) / 12
      item.save
    end
  end

end
