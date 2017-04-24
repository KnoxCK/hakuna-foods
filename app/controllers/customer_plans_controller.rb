class CustomerPlansController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer
  before_action :set_customer_plan, only: [:edit, :update]

  def new
    @customer_plan = CustomerPlan.new
  end

  def create
    @customer_plan = CustomerPlan.create(customer_id: @customer.id,
      meal_plan_id: meal_plan_params[:meal_plan_id], days_per_week:
        meal_plan_params[:days_per_week])
    meal_plan_params[:subscription] == "Yes - Monthly" ?
      @customer_plan.subscription = true : @customer_plan.subscription = false
    @customer_plan.save
    redirect_to new_customer_customer_plan_extra_item_path(@customer.id, @customer_plan.id)
  end

  def edit
  end

  def update
    @customer_plan.update(meal_plan_params)
    redirect_to new_customer_customer_plan_extra_item_path(@customer.id, @customer_plan.id)
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.where(customer_id: params[:customer_id]).first
  end

  def meal_plan_params
    params.require(:customer_plan).permit(:meal_plan_ids, :days_per_week, :subscription)
  end
end
