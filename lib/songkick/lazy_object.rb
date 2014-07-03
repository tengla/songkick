
class Songkick::LazyObject < OpenStruct
  
  using StringExt

  def initialize(obj)
    
    tmp = {}
    
    obj.keys.each do |key|
      if obj[key].is_a?(Hash)
        tmp[key] = self.class.new( obj[key] )
      elsif obj[key].is_a?(Array)
        tmp[key] = obj[key].map{|o| self.class.new(o) }
      else
        tmp[key] = obj[key]
      end
    end
    
    tmp.keys.each { |key| tmp[key.underscore] = tmp.delete(key) }

    super(tmp)
  end

  def keys
    methods(false).select do |meth|
      !meth.to_s.match(/\=\Z/)
    end
  end

end
