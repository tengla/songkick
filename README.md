# Songkick

* Ruby Songkick API version 3.0

* Not all end points are implemented yet.

### It's easy to make your own though.

    class Event < Songkick::Api::Base
      # Take a look at Songkick api endpoint uri's for more info
      # Notice that the key,value names in the uri must match those you provide in hash
      # when calling.
      # Use a dash, before and after, the value to be substituted.
      # Like so: artist_name=-artist_name-
      songkick :search, 'http://api.songkick.com/api/3.0/events.json?artist_name=-artist_name-&location=-location-&apikey=-api_key-'
    end
    client = Songkick::Client.new "apikey"
    event  = Event.new( client )
    result = event.search :artist_name => "The Pixies", :location => "ip:127.0.0.1"

Alternatively, for those that are implemented:

    client = Songkick::Client.new("apikey")
    result = client.location.search :query => "Oslo, Norway"

If you want your own classes to be accessible under a Client instance, define them like this:

    class Songkick::Api::Location
      include Songkick::Api::InstanceMethods
      extend  Songkick::Api::ClassMethods
      # search :query => 'what?'
      songkick :search, 'http://api.songkick.com/api/3.0/search/locations.json?query=-query-&apikey=-api_key-'
    end
    
instead of subclassing Base