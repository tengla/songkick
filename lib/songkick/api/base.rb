module Songkick::Api
  class Base
    include Songkick::Api::InstanceMethods
    extend  Songkick::Api::ClassMethods
  end
end