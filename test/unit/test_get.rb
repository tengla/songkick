require './test/test_helper'

class TestGet < Minitest::Test
  
  def test_add_params
    url = "http://www.example.com/?a=-a-&b=-b-"
    assert_equal "http://www.example.com/?a=A&b=B", Songkick::Get.add_params(url,{:a => "A", :b => "B"}).to_s
  end

  def test_raw
    VCR.use_cassette('get_raw') do
      url = "http://api.songkick.com/api/3.0/search/locations.json?query=Oslo&apikey=#{SONGKICK_API_KEY}"
      response = Songkick::Get.raw(url)
      assert response.match(/\A{"resultsPage":{"status":"ok"/)
    end
  end

  def test_json
    client = Songkick::Client.new SONGKICK_API_KEY
    VCR.use_cassette('get_json') do
      url = "http://api.songkick.com/api/3.0/search/locations.json?query=Oslo&apikey=#{SONGKICK_API_KEY}"
      result = Songkick::Get.json( url )
      assert_equal "ok", result["resultsPage"]["status"]
    end
  end
end