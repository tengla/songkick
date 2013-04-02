class Songkick::Api::Artist

  songkick :calendar, 'artists/:artist_id/calendar.:format'
  songkick :search, 'search/artists.:format', :query
  
  def post_process_calendar(result)
    Songkick::LazyObject.new(result).results_page
  end

end