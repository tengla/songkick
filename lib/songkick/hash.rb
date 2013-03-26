class Hash
  
  def deep_fetch(key,obj=self)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find{ |*a| r=deep_fetch(key, a.last) }
      r
    end
  end

end