class Article < ApplicationRecord
  mount_uploader :cover_image, PhotoUploader

  validates :title, :content, :description, :date, presence: true

  def slug
    title.parameterize
  end
end

# t.string "title"
    # t.string "content"
    # t.boolean "published"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.string "cover_image"
    # t.text "description"
    # t.date "date"
