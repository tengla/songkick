module Songkick
  module Api
    module ClassMethods

      def songkick(key, url=nil)
        @songkick_uris ||= {}
        if url
          @songkick_uris[key] = url
          songkick_create_method(key)
        end
        @songkick_uris[key]
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