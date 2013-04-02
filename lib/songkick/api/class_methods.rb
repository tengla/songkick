require 'erb'

module Songkick
  module Api
    module ClassMethods

      def base_url
        "http://api.songkick.com/api/3.0/"
      end

      def songkick(key, *args)
        @songkick_uris ||= {}
        url = args.shift
        if url
          @songkick_uris[key] = [ url, args]
          songkick_create_method(key)
        end
        @songkick_uris[key]
      end
      
      def uri(base, params, options)
        
        base.scan(/:\w+/).each do |key|
          k = key.gsub(/\A:/,"").to_sym
          base = base.gsub(key, options[ k ].to_s ) if options[ k ]
        end
        
        base << "?apikey=" + options[:api_key].to_s
        
        params.each do |param|
          if options[ param ]
            base << "&#{param}=" + ERB::Util.url_encode( options[param] )
          end
        end

        base
      end
      
      def songkick_uri_for(meth, options)
        base, params = self.songkick( meth )
        base = self.base_url + base
        self.uri( base, params, options )
      end

      private
      def songkick_create_method(method_name)
        class_eval do
          define_method(method_name) do |options|

            raise "api_key not set" unless client.api_key
            
            options.merge!(:api_key => client.api_key)
            options.merge!(:format => :json) unless options[:format]

            uri = self.class.songkick_uri_for( __method__, options )
            
            result = Songkick::Get.send options[:format], uri

            self.respond_to?("post_process_#{__method__}") && 
            self.send( "post_process_#{__method__}", result ) || 
            result
          end
        end
      end

      def __songkicked__;true;end
    end
  end
end