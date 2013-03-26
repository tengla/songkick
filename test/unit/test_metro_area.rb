require './test/test_helper'

class TestMetroArea < MiniTest::Unit::TestCase
  
  def setup
    @client = Songkick::Client.new SONGKICK_API_KEY
  end

  def test_calendar
    VCR.use_cassette('metro_area_calendar') do
      result = @client.metro_area.calendar(31422) # Oslo
      assert_equal "ok", result.deep_fetch("status")
    end
  end

end