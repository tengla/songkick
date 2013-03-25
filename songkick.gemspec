# -*- encoding: utf-8 -*-

require File.expand_path('../lib/songkick/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Eng"]
  gem.email         = [ ENV["EMAIL"] ]
  gem.description   = %q{Ruby Songkick API}
  gem.summary       = %q{Ruby access to Songkick API version 3.0}
  gem.homepage      = "https://github.com/athlite/songkick"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "athlite-songkick"
  gem.require_paths = ["lib"]
  gem.version       = Songkick::VERSION
  gem.add_dependency('json')
end
