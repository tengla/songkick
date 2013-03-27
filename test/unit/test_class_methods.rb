require './test/test_helper'

class Person
  extend Songkick::Api::ClassMethods 
  songkick :a_test, "a_test"
end

class TestClassMethods < MiniTest::Unit::TestCase
  
  def test_base_url
    assert_equal "a_test", Person.songkick(:a_test)
  end
  
  def test_base_url_should_be_nil
    assert_equal nil, Person.songkick(:b_test)
  end

end