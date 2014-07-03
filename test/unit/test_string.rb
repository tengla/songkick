require './test/test_helper'

class TestString < Minitest::Test
  using StringExt
  def test_camelize
    assert_equal "MyTestClass", "my_test_class".camelize
  end
end
