class OrderMailer < ApplicationMailer
  def order_confirmation(customer)
    @customer = customer

    mail(to: @customer.email,
          subject: "A GREAT BIG THANK YOU!")
  end

  def order_received(customer)
    @customer = customer

    mail(to: 'info@hakunafoods.co.uk',
          subject: "You have recieved a new order!")
  end

  def bespoke_request(customer)
    @customer = customer

    mail(to: "info@hakunafoods.co.uk",
          subject: "You have been sent a request for a bespoke meal plan")
  end
end
