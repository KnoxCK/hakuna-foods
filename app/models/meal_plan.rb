class MealPlan < ApplicationRecord

mount_uploader :photo, PhotoUploader

has_many :customer_plans

monetize :daily_price_pennies

end
