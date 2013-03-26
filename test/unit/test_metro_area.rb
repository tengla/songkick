require './test/test_helper'

class TestMetroArea < MiniTest::Unit::TestCase
  
  def setup
    @client = Songkick::Client.new SONGKICK_API_KEY
  end

  def test_upcoming_events
    VCR.use_cassette('metro_area_upcoming_events') do
      result = @client.metro_area.upcoming_events(31422)
      assert_equal "ok", result.deep_fetch("status")
    end
  end

end