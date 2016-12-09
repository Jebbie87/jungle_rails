class JungleMailer < ApplicationMailer
  # default from: "jeffreychang1987@hotmail.com"

  def sample_email
  #   @user = user
  #   puts "test #{@user}"
  mg_client = Mailgun::Client.new 'key-8320fde99fcc73629d62a5a80cc0df04'

  message_params =  { from: 'jeffreycj.chang@gmail.com',
                    to:   'jeffreychang1987@hotmail.com',
                    subject: 'The Ruby SDK is awesome!',
                    text:    'It is really easy to send a message!'
                    }

  mg_client.send_message 'sandbox3a7303edc035451b940c8b1bbc7ae8e9.mailgun.org', message_params
  #   @url = 'jeffreycj.chang@gmail.com'
  #   # mail(to: 'jeffreycj.chang@gmail.com', subject: 'Order test') do |format|
  #   #   puts format.html
  #   # end
  #   mail from: 'jeffreychang1987@hotmail.com', to: 'jeffreycj.chang@gmail.com', subject: 'this is an email'
  end
end

