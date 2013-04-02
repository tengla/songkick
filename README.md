# Songkick

* Ruby Songkick API version 3.0

* Not all end points are implemented.

### It's easy to make your own though.

    class Songkick::Api::Location
      # search :query => 'what?'
      songkick :search, 'search/locations.:format', :query
    end

    @client = Songkick::Client.new("apikey")
    result = @client.location.search :query => "Oslo, Norway"

### If you want to post process the result
    
    class Songkick::Api::Location
      # search :query => 'what?'
      songkick :search, 'search/locations.:format', :query
      def post_process_search(result)
        # Do something with result
      end
    end

### Songkick::LazyObject

    class Songkick::Api::Location
      # search :query => 'what?'
      songkick :search, 'search/locations.:format', :query
      def post_process_search(result)
        # LazyObject creates a object structure from a hash
        Songkick::LazyObject(result)
      end
    end
    