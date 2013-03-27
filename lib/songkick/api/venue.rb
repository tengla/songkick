module Songkick::Api
  
  class Venue
    
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods

    # i.e. search :query => 'query'
    songkick :search, 'http://api.songkick.com/api/3.0/search/venues.json?query=-query-&apikey=-api_key-'
    
    # i.e. calendar :venue_id => 123
    songkick :calendar, "http://api.songkick.com/api/3.0/venues/-venue_id-/calendar.json?apikey=-api_key-"

  end
  
end