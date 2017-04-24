class ExtraItemsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, :set_customer_plan

  def new
    @extras = Extra.all
  end

  def create
    @customer_plan.extras(params)
    @customer_plan.calculate_monthly_extras
    @customer_plan.calculate_total_price
    redirect_to new_customer_address_path(@customer)
  end

  def edit
    @extras = Extra.all
  end

  def update
    @customer_plan.update_extras(params)
    @customer_plan.calculate_monthly_extras
    @customer_plan.calculate_total_price
    redirect_to customer_path(@customer)
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.find(params[:customer_plan_id])
  end

end
