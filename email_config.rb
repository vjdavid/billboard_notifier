require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :port      => 587,
    :address   => "smtp.mandrillapp.com",
    :user_name => "YOUR_USERNAME",
    :password  => "VALID_API_KEY"
  }
end

mail = Mail.new do
  from    'example@example.com'
  to      'example@example.com'
  subject 'Currently your movie is on presale'
  body    'Whooraay gohead and enjoy!'
end
