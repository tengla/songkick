require './test/test_helper'

class TestMetroArea < MiniTest::Unit::TestCase
  
  def setup
    @client = Songkick::Client.new SONGKICK_API_KEY
  end

  def test_calendar
    VCR.use_cassette('metro_area_calendar') do
      result = @client.metro_area.calendar(:metro_area_id => 31422) # Oslo
      assert_equal "ok", result.results_page.status
    end
  end

end