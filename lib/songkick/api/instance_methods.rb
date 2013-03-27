module Songkick
  module Api
    module InstanceMethods
      attr_accessor :client
      
      def initialize(client)
        @client = client
      end

      def method_missing(method_name, *args, &block)
        options = args.shift || {}
        options.merge!(:api_key => client.api_key)

        self.class.base_url(method_name) &&
        Songkick::Get.json( self.class.base_url(method_name), options) ||
        super
      end
    end
  end
end