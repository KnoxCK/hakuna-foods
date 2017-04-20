class CustomerPlansController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer

  def new
    @customer_plan = CustomerPlan.new
  end

  def create
    @customer_plan = CustomerPlan.create(customer_id: @customer.id, meal_plan_id: meal_plan_params[:product_ids])
    meal_plan_params[:subscription] == "Yes - Monthly" ? @customer_plan.subscription = true : @customer_plan.subscription = false
    @customer_plan.save
    redirect_to about_path
  end

  def edit
  end

  def update
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def meal_plan_params
    params.require(:customer_plan).permit(:product_ids, :days_per_week, :subscription)
  end
end
