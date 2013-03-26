
class Songkick::Get

  class << self
    
    def replace_keys(url, hash)
      hash.each do |key,value|
        url = url.gsub(/-#{key}-/,value)
      end
      url
    end

    def raw(url, hash)
      open( replace_keys(url, hash) ).read
    end

    def json(*args)
      result = raw(*args)
      JSON.parse( result )
    end

  end
end