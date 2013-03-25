
class Songkick::Get

  class << self

    def raw(url, keys_values)
      keys_values.each do |k,v|
        url = url.gsub(/-#{k}-/,v)
      end
      open(url).read
    end

    def json(*args)
      result = raw(*args)
      hash = JSON.parse( result )
    end

  end
end