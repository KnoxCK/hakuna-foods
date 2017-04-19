class CustomersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    Customer.create(customer_params)
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :postcode)
  end
end
