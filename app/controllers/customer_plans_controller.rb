class CustomerPlansController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer
  before_action :set_customer_plan, only: [:edit, :update]

  def new
    @customer_plan = CustomerPlan.new
  end

  def create
    @customer_plan = CustomerPlan.new(customer_id: @customer.id,
      meal_plan_id: meal_plan_params[:meal_plan_id], days_per_week: 5, subscription: meal_plan_params[:subscription])
    if @customer_plan.save
      redirect_to new_customer_address_path(@customer)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @customer_plan.meal_plan_id = meal_plan_params[:meal_plan_id] if meal_plan_params[:meal_plan_id]
    @customer_plan.subscription = meal_plan_params[:subscription] if meal_plan_params[:subscription]
    @customer_plan.half_package = meal_plan_params[:half_package] if meal_plan_params[:half_package]
    if @customer_plan.save
      @customer_plan.calculate_total_price
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  private

  def set_customer
    @customer = Customer.friendly.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.where(customer: @customer).first
  end

  def meal_plan_params
    params.require(:customer_plan).permit(:meal_plan_id, :subscription, :half_package)
  end
end
