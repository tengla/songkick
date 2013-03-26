
abort("SONGKICK_API_KEY is not set, exiting.") unless ENV['SONGKICK_API_KEY']
SONGKICK_API_KEY = ENV['SONGKICK_API_KEY']

require 'minitest/autorun'
require 'minitest/mock'
require 'webmock/minitest'
require 'songkick'
require 'yaml'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
