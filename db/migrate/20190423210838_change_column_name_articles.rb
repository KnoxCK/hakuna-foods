class ChangeColumnNameArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :image, :cover_image
  end
end
