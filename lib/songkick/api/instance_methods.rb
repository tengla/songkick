module Songkick
  module Api
    module InstanceMethods
      def initialize(client)
        @client = client
      end
    end
  end
end