module Songkick::Api
  
  class Event
    
    # search :artist_name => 'who', :location => 'where'
    # location must be one of 'sk:1234', 'geo:-21.22,40.0', 'clientip' or 'ip:127.0.0.1'
    songkick :search, 'events.:format', :artist_name, :location
    
  end
  
end