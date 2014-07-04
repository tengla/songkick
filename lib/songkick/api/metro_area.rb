module Songkick::Api
  
  class MetroArea
    
    # Example:
    # calendar :metro_area_id => 123, :page => 1, :per_page => 5
    songkick :calendar, 'metro_areas/:metro_area_id/calendar.json', :page, :per_page
    
    def post_process_calendar(result)
      Songkick::LazyObject.new(result['resultsPage'])
    end
    
  end
  
end