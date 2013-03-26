module Songkick::Api
  
  class Venue
    attr_accessor :client
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods

    base_url :search, 'http://api.songkick.com/api/3.0/search/venues.json?query=-query-&apikey=-api_key-'
    base_url :calendar, "http://api.songkick.com/api/3.0/venues/-venue_id-/calendar.json?apikey=-api_key-"

    def search(query)
      query = query.split.join("+")
      Songkick::Get.json( self.class.base_url(__method__), :query => query, :api_key => client.api_key)
    end

    def calendar(venue_id)
      Songkick::Get.json( self.class.base_url(__method__), :venue_id => venue_id, :api_key => client.api_key)
    end
    
  end
  
end