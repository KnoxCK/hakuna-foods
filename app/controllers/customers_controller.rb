class CustomersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @customer = Customer.create(customer_params)
    if @customer.check_postcode(customer_params[:postcode])
      @customer.valid_postcode = true
      @customer.save

    else
      @customer.valid_postcode = false
      @error = "Sorry, we do not deliver to your area. Fuck Off."
      @customer.save
    end


  end

  def edit

  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :postcode, :first_name, :last_name,
     :gender, :dob, :height, :weight, :exercise, :occupation, :allergies,
      :preferences, :phone)
  end
end
