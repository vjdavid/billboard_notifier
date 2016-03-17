require 'mail'

class EmailConfig

  def initialize
    Mail.defaults do
      delivery_method :smtp,
        port:       587,
        address:    'smtp.mandrillapp.com',
        user_name:  ENV['YOUR_USERNAME'],
        password:   ENV['VALID_API_KEY']
    end
  end

  def send_email
    mail = Mail.new do
      from    ENV['FROM_EMAIL']
      to      ENV['TO_EMAIL']
      subject 'Currently your movie is on presale'
      body    'Whooraay gohead and enjoy!'
    end

    mail.deliver!
  end

end
