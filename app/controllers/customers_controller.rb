class CustomersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, except: [:create]

  def show
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.check_postcode(customer_params[:postcode])
      @customer.valid_postcode = true
      @customer.save
      redirect_to edit_customer_path(@customer)
    else
      @customer.valid_postcode = false
      @error = "We're terribly sorry, but we do not deliver to your area. Fuck Off."
      @customer.save
    end
  end

  def edit
  end

  def update
    @customer.update(customer_edit_params)
    if @customer.customer_plan
      redirect_to customer_path(@customer)
    else
      redirect_to new_customer_customer_plan_path(@customer)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :postcode)
  end

  def customer_edit_params
    params.require(:customer).permit(:first_name, :last_name,
     :gender, :dob, :height, :weight, :exercise, :occupation, :allergies,
      :preferences, :phone)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
