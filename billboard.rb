require 'httparty'
require 'json'
require 'mail'

base_uri = 'http://www.cinepolis.com/manejadores/CarteleraPreventas.ashx?CP=CinepolisMX'

   response = HTTParty.get(base_uri)
parsed_body = JSON.parse(response.parsed_response[16...-1])

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

parsed_body.each do |title|
  mail.deliver! if title["Titulo"].match(/batman/i) || title['Titulo'].match(/superman/i)
end
