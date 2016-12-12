class ExampleMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def sample_email(order)
    @order = order
    mail(:to => order.email, :subject => "Order details for order id: ##{order.id}")
  end
end