class Songkick::Api::Location
  
  # search :query => 'what?'
  songkick :search, 'search/locations.json', :query
  songkick :search_by_ip, 'search/locations.json', :location, :page, :per_page
  
  def post_process_search(result)
    Songkick::LazyObject.new(result)
  end

  def post_process_search_by_ip(result)
    obj = Songkick::LazyObject.new(result).results_page
  end
end