require './test/test_helper'

class TestLocation < MiniTest::Unit::TestCase
  
  def setup
    @client = Songkick::Client.new SONGKICK_API_KEY
  end

  def test_search
    VCR.use_cassette('location_search') do
      result = @client.location.search(:query => "Oslo")
      assert_equal 31422, result.results_page.results.location[0].metro_area.id
    end
  end

end