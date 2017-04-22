class AddressesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    redirect_to about_path
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def address_params
    params.require(:address).permit(:id, :address_line1, :address_line2,
      :address_line2, :postcode, :delivery_instructions)
  end

end
