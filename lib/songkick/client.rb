class Songkick::Client
  
  attr_accessor :api_key
  
  def initialize(api_key)
    @api_key = api_key
  end

  def method_missing(klass_name, *args, &block)
    klass = Songkick.class_eval(klass_name.to_s.camelize)
    klass.new(self)
  end
end
