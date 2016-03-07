require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :port      => 587,
    :address   => "smtp.mandrillapp.com",
    :user_name => "YOUR_USERNAME",
    :password  => "VALID_API_KEY"
  }
end
