class ExtraItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @extra_items = Product.where(category_id: Category.where(name: 'Extras').first.id)
    @extras = []
  end

  def create
  end

  private
end
