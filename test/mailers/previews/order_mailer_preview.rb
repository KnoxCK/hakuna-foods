class OrderMailerPreview < ActionMailer::Preview
  def order_confirmation
    OrderMailer.order_confirmation(Customer.first)
  end
end
