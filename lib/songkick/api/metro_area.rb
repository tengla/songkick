module Songkick::Api
  
  class MetroArea
    
    # i.e. calendar :metro_area_id => 123
    songkick :calendar, 'metro_areas/:metro_area_id/calendar.:format'
    
    def post_process_calendar(result)
      Songkick::LazyObject.new(result)
    end
    
  end
  
end