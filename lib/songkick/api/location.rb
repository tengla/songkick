class Songkick::Api::Location
  
  include Songkick::Api::InstanceMethods
  extend  Songkick::Api::ClassMethods

  # search :query => 'what?'
  songkick :search, 'http://api.songkick.com/api/3.0/search/locations.json?query=-query-&apikey=-api_key-'
  
  #def search(query)
  #  query = query.split.join("+")
  #  result = Songkick::Get.json( self.class.base_url(__method__), :query => query, :api_key => client.api_key)
  #end
end