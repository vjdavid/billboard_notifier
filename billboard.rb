require 'httparty'
require 'json'
require_relative 'email_config'

base_uri = 'http://www.cinepolis.com/manejadores/CarteleraPreventas.ashx?CP=CinepolisMX'

   response = HTTParty.get(base_uri)
parsed_body = JSON.parse(response.parsed_response[16...-1])

parsed_body.each do |title|
  @mail.deliver! if title["Titulo"].match(/batman/i) || title['Titulo'].match(/superman/i)
end
