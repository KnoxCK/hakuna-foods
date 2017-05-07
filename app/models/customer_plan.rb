class CustomerPlan < ApplicationRecord
  belongs_to :customer
  has_one :order
  has_many :extra_items
  has_many :extras, through: :extra_items
  belongs_to :meal_plan

  monetize :total_price_pennies

  def add_extras(params)
    extras = Extra.pluck(:name)
    extra_items = []
    params.each do |key, value|
      if extras.include?(key) && (value != "0" && value != "")
        extra_items << [Extra.where(name: key).first.id, value]
      end
    end

    extra_items.each do |extra|
      ExtraItem.create(customer_plan_id: self.id, extra_id: extra[0],
       quantity_per_week: extra[1].to_i)
    end
  end

  def update_extras(params)
    extras = Extra.pluck(:name)
    extra_items = []
    params.each do |key, value|
      if extras.include?(key)
        extra_items << [Extra.where(name: key).first.id, value]
      end
    end

    extra_items.each do |extra|
      if ExtraItem.where(customer_plan_id: self.id, extra_id: extra[0])
        ExtraItem.where(customer_plan_id: self.id, extra_id: extra[0]).update(quantity_per_week: extra[1].to_i)
      else
        ExtraItem.create(customer_plan_id: self.id, extra_id: extra[0],
       quantity_per_week: extra[1].to_i)
      end
    end
  end

  def calculate_weekly_extras
    self.extra_items.each do |item|
      item.weekly_price = Extra.find(item.extra_id).unit_price * item.quantity_per_week
      item.save
    end
  end

  def calculate_total_price
    weekly_meal_plan_price = MealPlan.find(self.meal_plan_id).daily_price * self.days_per_week
    total_weekly_extras_price = 0
    self.extra_items.each do |item|
      total_weekly_extras_price += item.weekly_price
    end
    total_weekly_price = weekly_meal_plan_price + total_weekly_extras_price
    self.total_price = total_weekly_price.round(2)
    self.save
  end
end
