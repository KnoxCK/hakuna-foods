class CustomerPlan < ApplicationRecord
  belongs_to :customer
  has_one :order
  has_many :extra_items
  has_many :extras, through: :extra_items
  belongs_to :meal_plan


  def extras(params)
    # unless params["Kombucha"] == "" || params["Kombucha"] == "0"
    #   ExtraItem.create!(product_id: Product.where(name: 'Kombucha').first.id,
    #     quantity_per_week: params["Kombucha"].to_i, customer_plan_id: self.id)
    # end
    # unless params["Cold Press Coffee"] == "" || params["Cold Press Coffee"] == "0"
    #   ExtraItem.create!(product_id: Product.where(name: 'Cold Press Coffee').first.id,
    #     quantity_per_week: params["Cold Press Coffee"].to_i, customer_plan_id: self.id)
    # end
    # unless params["Sweet Treat"] == "" || params["Sweet Treat"] == "0"
    #   ExtraItem.create!(product_id: Product.where(name: 'Sweet Treat').first.id,
    #     quantity_per_week: params["Sweet Treat"].to_i, customer_plan_id: self.id)
    # end
    extras = Extra.pluck(:name)
    extra_items = []
    params.each do |key, value|
      if extras.include?(key) && (value != "0" && value != "")
        extra_items << [Extra.where(name: key).first.id, value]
      end
    end

    extra_items.each do |extra|
      ExtraItem.create!(customer_plan_id: self.id, extra_id: extra[0],
       quantity_per_week: extra[1].to_i)
    end
  end

  def calculate_monthly_extras
    self.extra_items.each do |item|
      item.monthly_price = (Extra.find(item.extra_id).unit_price * item.quantity_per_week * 52) / 12
      item.save
    end
  end

  def calculate_total_price
    monthly_meal_plan_price = (MealPlan.find(self.meal_plan_id).daily_price * self.days_per_week * 52) / 12
    total_monthly_extras_price = 0
    self.extra_items.each do |item|
      total_monthly_extras_price += item.monthly_price
    end
    total_monthly_price = monthly_meal_plan_price + total_monthly_extras_price
    self.total_price = total_monthly_price.round(2)
    self.save
  end
end
