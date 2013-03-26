module Songkick
  module Api

    module ClassMethods

      def base_url(url=nil)
        url && (@base_url = url) || @base_url
      end

    end
    
  end
end