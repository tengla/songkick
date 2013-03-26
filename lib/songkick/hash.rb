class Hash

  def deep_fetch(key, hash=self)
    hash.keys.each do |k|
      p hash.has_key?(k)
      return hash[k] if hash.has_key?(k)
      if hash[k].is_a?(Array)
        hash[k].each do |item|
          return deep_fetch(key, item) if item.is_a?(Hash)
        end
      end
      return deep_fetch(key, hash[k])
    end
  end

end