require 'httparty'
require 'json'
require_relative 'email_config'

base_uri = 'http://www.cinepolis.com/manejadores/CarteleraPreventas.ashx?CP=CinepolisMX'

   response = HTTParty.get(base_uri)
parsed_body = JSON.parse(response.parsed_response[16...-1])

mail = Mail.new do
  from    'example@example.com'
  to      'example@example.com'
  subject 'Currently your movie is on presale'
  body    'Whooraay gohead and enjoy!'
end

parsed_body.each do |title|
  mail.deliver! if title["Titulo"].match(/batman/i) || title['Titulo'].match(/superman/i)
end
