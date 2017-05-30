class OrderMailer < ApplicationMailer
  def order_confirmation(customer)
    @customer = customer

    mail (to: @customer.email
          subject: "Your Hakuna Foods Order Confirmation")
  end
end
