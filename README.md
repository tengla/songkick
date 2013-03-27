# Songkick

* Ruby Songkick API version 3.0

* Not all end points are implemented yet.

### It's easy to make your own though.

    class Event < Songkick::Api::Base
      # Take a look at Songkick api endpoint uri's for more info
      songkick :search, 'http://api.songkick.com/api/3.0/events.json?artist_name=-artist_name-&location=-location-&apikey=-api_key-'
    end
    client = Songkick::Client.new "apikey"
    event  = Event.new( client )
    result = event.search :artist_name => "The Pixies", :location => "ip:127.0.0.1"

