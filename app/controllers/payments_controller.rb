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

      if @order.state == 'Error'
        plan = Stripe::Plan.retrieve("#{@customer.email}-#{@order.id}")
      else
        plan = Stripe::Plan.create(
          name:     "#{@customer.full_name}-#{@customer_plan.meal_plan.name}
                      Plan - Order ##{@order.id}",
          id:       "#{@customer.email}-#{@order.id}",
          interval: "week",
          currency: "gbp",
          amount:   @order.total_price_pennies,
          )
      end

      if @customer.stripe_customer_id == nil
        Stripe::InvoiceItem.create(
          customer: customer.id,
          amount: 2500,
          currency: "gbp",
          description: "deposit for box"
          )
      end

      Stripe::Subscription.create(
        customer: customer.id,
        plan: plan.id,
        )

    else

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: (@order.total_price_pennies + 2500),
        description:  "Payment from #{@customer.full_name} for order ##{@order.id}",
        currency:     "gbp",
        )

    end

    @customer.update(stripe_customer_id: customer.id)
    @order.update(state: 'Paid')
    OrderMailer.order_confirmation(@customer).deliver_now
    OrderMailer.order_received(@customer).deliver_now
    flash[:notice] = "Thank you, your payment was successful."
    redirect_to customer_customer_plan_order_path(@customer, @customer_plan, @order)

  rescue Stripe::CardError => e
    @order.update(state: 'Error')
    flash[:alert] = "#{e.message} Please try again."
    redirect_to new_customer_customer_plan_order_payment_path(@customer, @customer_plan, @order)
  end

  protect_from_forgery

  private

  def set_customer
    @customer = Customer.friendly.find(params[:customer_id])
  end

  def set_customer_plan
    @customer_plan = CustomerPlan.find(params[:customer_plan_id])
  end

  def set_order
    @order = Order.where.not(state: 'Paid').find(params[:order_id])
  end

end
