require './test/test_helper'

class Person
  extend Songkick::Api::ClassMethods 
  base_url :a_test, "a_test"
end

class TestClassMethods < MiniTest::Unit::TestCase
  
  def test_base_url
    assert_equal "a_test", Person.base_url(:a_test)
  end
  
  def test_base_url_should_be_nil
    assert_equal nil, Person.base_url(:b_test)
  end

end