class AddressesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_customer

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    @address.customer_id = @customer.id
    if @address.save
      if @customer.customer_plan.meal_plan_id == 6
        OrderMailer.bespoke_request(@customer).deliver_now
        redirect_to bespoke_path
      else
        redirect_to customer_path(@customer)
      end
    else
      render 'new'
    end
  end

  def edit
    @address = @customer.address
  end

  def update
    @customer.address.update(address_params)
    @address = @customer.address
    if @address.save
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  private

  def set_customer
    @customer = Customer.friendly.find(params[:customer_id])
  end

  def address_params
    params.require(:address).permit(:customer_id, :address_line1, :address_line2,
      :address_line3, :postcode, :delivery_instructions)
  end

end
