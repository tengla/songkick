module Songkick::Api
  
  class Event
    
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods

    # search :artist_name => 'who', :location => 'where'
    # location must be one of 'sk:1234', 'geo:-21.22,40.0', 'clientip' or 'ip:127.0.0.1'
    songkick :search, 'http://api.songkick.com/api/3.0/events.json?artist_name=-artist_name-&location=-location-&apikey=-api_key-'
    
  end
  
end