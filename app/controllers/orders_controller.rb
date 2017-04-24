class OrdersController < ApplicationController
  skip_before_action :authenticate_user
  before_action :set_customer, :set_customer_plan

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.where(customer_id: params[:customer_id]).first
  end
end
