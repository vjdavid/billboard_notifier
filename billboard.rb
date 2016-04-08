require 'net/http'
require 'json'
require_relative 'email_config'

class Billboard < EmailConfig

  def uri
    'http://www.cinepolis.com/manejadores/CarteleraPreventas.ashx?CP=CinepolisMX'
  end

  def parsed_body
    JSON.parse(Net::HTTP.get(URI(uri))[16...-1])
  end

  def movie_list(movie)
    show_movies.select do |x|
      send_email if x.match(/#{movie}/i)
    end
  end

  def show_movies
    parsed_body.map { |title| title['Titulo'] }
  end

  private
  def send_email
    super
  end

end
