class Songkick::Api::Location
  
  # search :query => 'what?'
  songkick :search, 'search/locations.:format', :query
  
  def post_process_search(result)
    Songkick::LazyObject.new(result)
  end

end