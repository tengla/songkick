module Songkick::Api
  
  class Venue
    
    # search :query => 'query'
    songkick :search, 'search/venues.:format', :query
    
    # i.e. calendar :venue_id => 123
    songkick :calendar, 'venues/:venue_id/calendar.:format'

  end
  
end