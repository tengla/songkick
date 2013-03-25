class Songkick
  module ClassMethods
    
    def base_url=(url)
      @base_url = url
    end

    def base_url
      @base_url
    end

  end
end