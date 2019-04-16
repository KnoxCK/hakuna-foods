class Extra < ApplicationRecord
  has_many :extra_items
  has_many :customer_plans, through: :extra_items

  monetize :unit_price_cents
  mount_uploader :photo, PhotoUploader
end
