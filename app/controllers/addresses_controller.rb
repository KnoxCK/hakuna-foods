class AddressesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    @address.customer_id = @customer.id
    @address.save
    redirect_to customer_path(@customer)
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def address_params
    params.require(:address).permit(:customer_id, :address_line1, :address_line2,
      :address_line3, :postcode, :delivery_instructions)
  end

end
