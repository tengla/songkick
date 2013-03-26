module Songkick::Api
  
  class Event
    attr_accessor :client
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods

    base_url :search, 'http://api.songkick.com/api/3.0/events.json?artist_name=-artist_name-&location=-location-&apikey=-api_key-'

    # TODO: location must be one of 'sk:1234', 'geo:-21.22,40.0', 'clientip' or 'ip:127.0.0.1'
    def search(artist_name, location)
      opts = {:artist_name => artist_name.split.join("+"), :location => location.split.join("+"), :api_key => client.api_key }
      opts.merge!(:max_date)
      Songkick::Get.json( self.class.base_url(__method__), opts)
    end
    
  end
  
end