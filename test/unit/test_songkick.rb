require './test/test_helper'

class TestSongkick < Minitest::Test
  
  def test_api_key
    client = Songkick::Client.new("abc")
    assert_equal "abc", client.api_key
  end

  def test_metro_area
    client = Songkick::Client.new("abc")
    assert client.metro_area.is_a?(Songkick::Api::MetroArea)
  end

end
