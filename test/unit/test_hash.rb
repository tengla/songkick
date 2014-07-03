require './test/test_helper'

class TestHash < Minitest::Test
  
  using HashExt

  def setup
    @hash = {"a" => "A", "b" => [{"c" => "C", "d" => "D", "e" => [{"f" => "F", "g" => "G"}] }], "h" => "H"}
  end

  def test_should_deep_fetch_f
    assert_equal ["F"], @hash.deep_fetch("f")
  end

end