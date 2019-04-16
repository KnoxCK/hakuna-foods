class MealPlan < ApplicationRecord
  has_many :customer_plans

  monetize :daily_price_cents
  monetize :half_daily_price_cents

  mount_uploader :photo, PhotoUploader
end
