class MealPlansController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer

  def new
    @meal_plan = MealPlan.new
  end

  def create
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
