module Songkick
  module Api
    module InstanceMethods
      attr_accessor :client
      def initialize(client)
        @client = client
      end
    end
  end
end