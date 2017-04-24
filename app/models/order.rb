class Order < ApplicationRecord
  belongs_to :customer, through: :meal_plan
  has_one :meal_plan

  monetize :price_pennies

  # Displaying price
  # Amount: <%= humanized_money_with_symbol(@teddy.price) %></p>
end
