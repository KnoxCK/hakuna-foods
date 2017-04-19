class CustomersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @customer = Customer.create(customer_params)
    if @customer.check_postcode(customer_params[:postcode])
      redirect_to about_path
    else
      @error = "Sorry we do not delivery to your area"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :postcode)
  end
end
