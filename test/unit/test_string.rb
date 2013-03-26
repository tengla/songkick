require './test/test_helper'

class TestString < MiniTest::Unit::TestCase
  
  def test_camelize
    assert_equal "MyTestClass", "my_test_class".camelize
  end
  
end
