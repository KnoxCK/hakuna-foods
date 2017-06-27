class OrderMailer < ApplicationMailer
  def order_confirmation(customer)
    @customer = customer

    mail(to: @customer.email,
          subject: "Your Hakuna Foods Order Confirmation")
  end

  def bespoke_request(customer)
    @customer = customer

    mail(to: "info@hakunafoods.co.uk",
          subject: "You have a request for a bespoke meal plan")
  end
end
