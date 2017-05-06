class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, :set_customer_plan

  def show
    # @order = Order.where(state: 'paid').find(params[:id])
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(customer_plan_id: @customer_plan.id,
      state: 'Pending', total_price_pennies: @customer_plan.total_price)

    redirect_to customer_customer_plan_order_path(@customer.id, @customer_plan.id, @order.id)
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.where(customer_id: params[:customer_id]).first
  end
end
