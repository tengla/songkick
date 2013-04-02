module Songkick
  module Api
  end
end

class Object
  class << self
    def songkick(*args)
      return nil if self.respond_to?(:__songkicked__)
      self.send :include, Songkick::Api::InstanceMethods
      self.send :extend,  Songkick::Api::ClassMethods
      self.send :songkick, *args
    end
  end
end

require 'songkick/api/base'
require 'songkick/api/metro_area'
require 'songkick/api/location'
require 'songkick/api/venue'
require 'songkick/api/artist'
require 'songkick/api/event'
