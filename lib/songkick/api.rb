module Songkick
  module Api
    autoload :ClassMethods,     'songkick/api/class_methods'
    autoload :InstanceMethods,  'songkick/api/instance_methods'
    autoload :Base,             'songkick/api/base'
    autoload :MetroArea,        'songkick/api/metro_area'
    autoload :Location,         'songkick/api/location'
    autoload :Venue,            'songkick/api/venue'
    autoload :Artist,           'songkick/api/artist'
    autoload :Event,            'songkick/api/event'
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
