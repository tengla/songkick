require 'erb'
class Hash
  
  def deep_fetch(key,obj=self)
    aggr = []
    if obj.respond_to?(:key?) && obj.key?(key)
      aggr << obj[key]
    elsif obj.is_a?(Hash)
      ary = []
      obj.each{|k,v| ary << deep_fetch(key, v) }
      aggr << ary.flatten.compact
    elsif obj.is_a?(Array)
      ary = []
      obj.each{|item| ary << deep_fetch(key, item) }
      aggr << ary.flatten.compact
    end
    aggr.flatten
  end
end