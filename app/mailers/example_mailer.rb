class ExampleMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def sample_email(order)
    @order = order
    mail(:to => 'jeffreychang1987@hotmail.com', :subject => "Order details for order id: ##{order.id}")
  end
end