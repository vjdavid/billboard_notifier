require 'mail'

Mail.defaults do
  delivery_method :smtp,
    port:       587,
    address:    'smtp.mandrillapp.com',
    user_name:  ENV['YOUR_USERNAME'],
    password:   ENV['VALID_API_KEY']
end
