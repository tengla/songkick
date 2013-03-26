
class Songkick::Get

  class << self

    def raw(url, hash)
      hash.each do |key,value|
        url = url.gsub(/-#{key}-/,value)
      end
      open(url).read
    end

    def json(*args)
      result = raw(*args)
      JSON.parse( result )
    end

  end
end