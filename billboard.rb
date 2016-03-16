require 'net/http'
require 'json'
require_relative 'email_config'

class Billboard

  def uri
    'http://www.cinepolis.com/manejadores/CarteleraPreventas.ashx?CP=CinepolisMX'
  end

  def parsed_body
    JSON.parse(Net::HTTP.get(URI(uri))[16...-1])
  end

  def movie_list(movie)
    mail = Mail.new do
      from    'example@example.com'
      to      'example@example.com'
      subject 'Currently your movie is on presale'
      body    'Whooraay gohead and enjoy!'
    end

    show_movies.map do |x|
      mail.deliver! if x.match(/#{movie}/i)
    end
  end

  def show_movies
    parsed_body.map { |title| title['Titulo'] }
  end

end
