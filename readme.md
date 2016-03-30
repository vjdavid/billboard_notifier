## Billboard Notifier                                            
I personally, use this script when I want know when comes out some favorite of the cinema, And know the date that is movie is will be avaiblable for buy tickets.

### Methods
##### public methods
`object#uri` Get the URI of the cinepolis publisher billboard.

`object#parsed_body` Get the body details of all movies in JSON format.

`object#movie_list(my_movie)` Check if my movie is on the billoard and return it, `my_movie` param is a `string`.

`object#show_movies` List all movies of the billboard.

##### private methods
`send_email` Send email to the contact seted on the configuration.

### Configuration

Just you need set the API_KEYS of Mandrill, or if you want you can use the Gmail
as SMTP, service that archive is called this on the root folder `email_config.rb`.
