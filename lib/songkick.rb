require 'open-uri'
require 'json'
require 'nokogiri'

require 'songkick/string_ext'
require 'songkick/hash'

module Songkick
  autoload :VERSION,    'songkick/version'
  autoload :Get,        'songkick/get'
  autoload :Client,     'songkick/client'
  autoload :LazyObject, 'songkick/lazy_object'
  autoload :Api,        'songkick/api'
end
