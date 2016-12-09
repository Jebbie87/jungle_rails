class ExampleMailer < ApplicationMailer
  default from: 'jeffreycj.chang@gmail.com'

  def sample_email
    mail(to: 'jeffreychang1987@hotmail.com', subjecet: 'Order details')
  end
end
