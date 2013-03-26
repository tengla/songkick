require './test/test_helper'

class TestGet < MiniTest::Unit::TestCase
  
  def test_replace_keys
    url = "http://www.example.com/?a=-a-&b=-b-"
    assert_equal "http://www.example.com/?a=A&b=B", Songkick::Get.replace_keys(url,{:a => "A", :b => "B"})
  end

  def test_raw
    VCR.use_cassette('get_raw') do
      url = "http://api.songkick.com/api/3.0/search/locations.json?query=-query-&apikey=-api_key-"
      hash = {:query => "Oslo", :api_key => SONGKICK_API_KEY }
      response = Songkick::Get.raw(url, hash)
      assert response.match(/\A{"resultsPage":{"status":"ok"/)
    end
  end

  def test_json
    client = Songkick::Client.new SONGKICK_API_KEY
    VCR.use_cassette('get_json') do
      result = Songkick::Get.json( Songkick::Api::Location.base_url(:search), :query => "Oslo", :api_key => client.api_key)
      assert_equal "ok", result["resultsPage"]["status"]
    end
  end
end