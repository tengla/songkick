require './test/test_helper'

class TestHash < MiniTest::Unit::TestCase
  
  def setup
    @hash = {"a" => "A", "b" => [{"c" => "C", "d" => "D", "e" => [{"f" => "F", "g" => "G"}] }], "h" => "H"}
  end

  def test_respond_to_deep_fetch  
    assert @hash.respond_to?(:deep_fetch)
  end

  def test_should_deep_fetch_f
    assert_equal ["F"], @hash.deep_fetch("f")
  end

end