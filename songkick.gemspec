# -*- encoding: utf-8 -*-

require File.expand_path('../lib/songkick/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Eng"]
  gem.email         = [ ENV["EMAIL"] ]
  gem.description   = %q{Ruby Songkick API}
  gem.summary       = %q{API version 3.0}
  gem.homepage      = "https://github.com/athlite/songkick"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "athlite-songkick"
  gem.require_paths = ["lib"]
  gem.version       = Songkick::VERSION

  gem.add_dependency('json')
  gem.add_dependency('nokogiri')
  gem.add_dependency('bundler')
  gem.add_dependency('vcr')
  gem.add_dependency('webmock', '1.8.0')

  # This is for being able to run 'bundle exec pry'
  # on the cli
  gem.add_dependency('pry')
end
