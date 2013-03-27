require 'erb'
class Songkick::Get

  class << self
    
    attr_accessor :debug

    def replace_keys(url, hash)
      hash.each do |key,value|
        url = url.gsub(/-#{key}-/, ERB::Util.url_encode(value) )
      end
      if hash.key?(:page)
        url << "&page=#{hash[:page]}"
      end
      url
    end

    def raw(url, hash)
      _url = replace_keys(url, hash)
      ['url','_url','hash'].each do |lv|
        p instance_eval(lv)
      end if @debug  
      open( _url ).read
    end
    
    def json(*args)
      result = raw(*args)
      JSON.parse( result )
    end
  end
end