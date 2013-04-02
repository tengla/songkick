require 'uri'
class Songkick::Get

  class << self
    
    attr_accessor :debug

    def add_params(uri, params)

      _params = params.dup # no side effects!?
      
      _params.each do |key,value|
        if uri.match(/-#{key}-/) && value
          uri = uri.gsub(/-#{key}-/, URI.encode( _params.delete(key).to_s ) )
        end
      end

      uri = URI(uri)

      if _params.key?(:page)
        uri << "&page=#{hash[:page]}"
      end
      uri
    end

    def raw(uri)
      begin
        open( uri ).read
      rescue Exception => e 
        puts e.message
        puts uri
        raise "could not get resource"
      end
    end
    
    def json(uri)
      result = raw(uri)
      JSON.parse( result )
    end
    
    def xml(uri)
      result = raw(uri)
      Nokogiri::XML.parse( result )
    end

  end
end