class Songkick::Api::Location
  attr_accessor :client
  include Songkick::InstanceMethods
  extend  Songkick::ClassMethods
  self.base_url = "http://api.songkick.com/api/3.0/search/locations.json?query=-query-&apikey=-api_key-"

  def search(query)
    query = query.split.join("+")
    Songkick::Get.json( self.class.base_url, :query => query, :api_key => client.api_key)
  end
end