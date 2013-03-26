module Songkick
  module Api

    module ClassMethods

      def base_url(key, url=nil)
        @base_urls ||= {}
        if url
          @base_urls[key] = url
        else
          @base_urls[key]
        end
        @base_urls[key]
      end

    end
    
  end
end