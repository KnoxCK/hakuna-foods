class ExtraItemsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, :set_customer_plan

  def new
    @extra_items = Product.where(category_id: Category.where(name: 'Extras').first.id)
    @extras = []
  end

  def create
    @customer_plan.extras(params)
    @customer_plan.calculate_monthly_extras
    @customer_plan.calculate_total_price
    redirect_to "customers/#{@customer.id}/address"
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.find(params[:customer_plan_id])
  end

end
