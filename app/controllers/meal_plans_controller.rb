class MealPlansController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer

  def new
    @meal_plan = MealPlan.new
  end

  def create
    @meal_plan_item = MealPlanItem.create(customer_id: @customer.id,
     product_id: meal_plan_params[:product_ids].to_i,
      quantity_per_week: meal_plan_params[:days_per_week].to_i)
    MealPlan.create(meal_plan_item_id: @meal_plan_item.id)
    redirect_to about_path
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:product_ids, :days_per_week)
  end
end
