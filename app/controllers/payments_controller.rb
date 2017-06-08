class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, :set_customer_plan, :set_order

  def new
  end

  def create
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  @customer.email,
        )

    if @customer_plan.subscription

      # if Stripe::Plan.retrieve("#{@customer.email}-#{@order.id}").exists?
      #   plan = Stripe::Plan.retrieve("#{@customer.email}-#{@order.id}")
      # else
        plan = Stripe::Plan.create(
          name:     "#{@customer.full_name}-#{@customer_plan.meal_plan.name}
                      Plan - Order ##{@order.id}",
          id:       "#{@customer.email}-#{@order.id}",
          interval: "week",
          currency: "gbp",
          amount:   @order.total_price_pennies,
          )


      Stripe::Subscription.create(
        customer: customer.id,
        plan: plan.id,
        )

    else

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @order.total_price_pennies,
        description:  "Payment from #{@customer.full_name} for order ##{@order.id}",
        currency:     "gbp",
        )

    end

    @customer.update(stripe_customer_id: customer.id)
    @order.update(state: 'Paid')
    # OrderMailer.order_confirmation(@customer).deliver_now
    redirect_to customer_customer_plan_order_path(@customer, @customer_plan, @order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_customer_customer_plan_order_payment_path(@customer, @customer_plan, @order)
  end

  protect_from_forgery

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.find(params[:customer_plan_id])
  end

  def set_order
    @order = Order.where(state: 'Pending').find(params[:order_id])
  end

end
