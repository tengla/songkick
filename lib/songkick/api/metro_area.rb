module Songkick::Api
  
  class MetroArea
    
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods

    # i.e. calendar :metro_area_id => 123
    songkick :calendar, 'http://api.songkick.com/api/3.0/metro_areas/-metro_area_id-/calendar.json?apikey=-api_key-'

  end
  
end