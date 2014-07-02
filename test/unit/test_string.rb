require './test/test_helper'

class TestString < Minitest::Test
  
  def test_camelize
    assert_equal "MyTestClass", "my_test_class".camelize
  end
  
end
