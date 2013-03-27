class Songkick::Api::Location
  
  include Songkick::Api::InstanceMethods
  extend  Songkick::Api::ClassMethods

  # search :query => 'what?'
  songkick :search, 'http://api.songkick.com/api/3.0/search/locations.json?query=-query-&apikey=-api_key-'

end