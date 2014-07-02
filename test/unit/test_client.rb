require './test/test_helper'

class TestClient < Minitest::Test
  
  def setup
    @client = Songkick::Client.new SONGKICK_API_KEY
  end

  def test_client
    assert !nil, @client.api_key
  end

end