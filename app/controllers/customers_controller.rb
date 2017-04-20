class CustomersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer, only: [:update, :edit]

  def create
    @customer = Customer.create(customer_params)
    if @customer.check_postcode(customer_params[:postcode])
      @customer.valid_postcode = true
      @customer.save
      redirect_to edit_customer_path(@customer)
    else
      @customer.valid_postcode = false
      @error = "Sorry, we do not deliver to your area. Fuck Off."
      @customer.save
    end


  end

  def edit
  end

  def update
    @customer.update(customer_edit_params)
    redirect_to about_path
  end

  def create_meal_plan
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
