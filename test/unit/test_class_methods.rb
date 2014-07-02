require './test/test_helper'

class Person
  extend Songkick::Api::ClassMethods 
  songkick :a_test, "a_test"
end

class TestClassMethods < Minitest::Test
  
  def test_base_url
    assert_equal "http://api.songkick.com/api/3.0/", Person.base_url
  end

  def test_songkick
    assert_equal ["a_test",[]], Person.songkick(:a_test)
  end
  
  def test_songkick_should_be_nil
    assert_equal nil, Person.songkick(:b_test)
  end
  
  def test_uri
    a = "http://www.example.com/"
    b = "test/:id.:format"
    options = {:id => 9, :api_key => 1, :format => :json}
    assert_equal "#{a}test/9.json?apikey=1", Person.uri(a+b, [], options)
  end

end