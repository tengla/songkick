module Songkick::Api
  
  class MetroArea
    attr_accessor :client
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods

    base_url :upcoming_events, 'http://api.songkick.com/api/3.0/metro_areas/-metro_area_id-/calendar.json?apikey=-api_key-'

    def upcoming_events(metro_area_id)
      Songkick::Get.json( self.class.base_url(__method__), :metro_area_id => metro_area_id.to_s, :api_key => client.api_key)
    end
    
  end
  
end