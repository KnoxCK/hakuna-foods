class CustomersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, except: [:create]

  def show
  end

  def create
    # Customer.where(email: customer_params[:email]) ? @customer = Customer.where(email: customer_params[:email]).first :
    @customer = Customer.new(customer_params)
    if @customer.email != "" && @customer.postcode != ""
      @customer.save(validate: false)
      if @customer.check_postcode(customer_params[:postcode])
        @customer.valid_postcode = true
        @customer.save
        redirect_to edit_customer_path(@customer)
      else
        @customer.valid_postcode = false
        @error = "We're very sorry, but we do not currently deliver to your area."
        @customer.save
      end
    else
      @error = "You must provide a valid email and first part of your postcode"
      redirect_to orderform_path({error: @error})
    end
  end

  def edit
    @customer.build_customer_plan
  end

  def update
    @customer.update(customer_edit_params)
    @customer_plan = @customer.build_customer_plan(customer_plan_params)
    # @customer.customer_plan.save
    # if @customer.first_name == ""
    #   @error = "You must provide your first name"
    #   redirect_to edit_customer_path(@customer)
    if @customer.save && @customer_plan.save
      if @customer.address
        redirect_to customer_path(@customer)
      else
        redirect_to new_customer_address_path(@customer)
      end
    else
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :postcode)
  end

  def customer_edit_params
    params.require(:customer).permit(:first_name, :last_name,
     :gender, :dob, :height, :weight, :exercise, :occupation, :allergies,
      :preferences, :phone, customer_plan_attributes: [:meal_plan_id, :subscription])
  end

  def customer_plan_params
    params.require(:customer).require(:customer_plan).permit(:subscription, :meal_plan_id)
  end

  def set_customer
    @customer = Customer.friendly.find(params[:id])
  end
end
