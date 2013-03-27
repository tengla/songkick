module Songkick
  module Api
    module ClassMethods

      def songkick(key, url=nil)
        @base_urls ||= {}
        if url
          @base_urls[key] = url
          songkick_create_method(key)
        else
          @base_urls[key]
        end
        @base_urls[key]
      end

      private
      def songkick_create_method(method_name)
        class_eval do
          define_method(method_name) do |options|
            options.merge!(:api_key => client.api_key)
            Songkick::Get.json( self.class.songkick(__method__), options)
          end
        end
      end
    end
  end
end