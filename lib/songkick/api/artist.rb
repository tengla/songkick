class Songkick::Api::Artist

  songkick :calendar, 'artists/:artist_id/calendar.:format'
  songkick :search, 'search/artists.:format', :query
  
  def post_process_calendar(result)
    @result = result
    Songkick::LazyObject.new(@result['resultsPage'])
  end

end