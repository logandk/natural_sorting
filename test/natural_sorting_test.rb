require 'test/unit'
require File.join(File.dirname(__FILE__), '..', 'init')

class NaturalSortingTest < Test::Unit::TestCase
  def test_string
    assert_equal -1, String.natcmp("hello", "world")
  end
  
  def test_string_case
    assert_equal -1, String.natcmp("hello", "World")
  end
  
  def test_string_case_sensitive
    assert_equal 1, String.natcmp("hello", "World", :case_sensitive => true)
  end
  
  def test_string_numeric
    assert_equal -1, String.natcmp("2", "11")
  end
  
  def test_array
    assert_equal ["1 image", "2 image", "3 image", "11.3533", "11.6345", "11 image", "test 4.3", "test 45.6", "test 50.6.5"], ["1 image", "2 image", "3 image", "11 image", "11.6345", "11.3533", "test 45.6", "test 4.3", "test 50.6.5"].sort_natural
  end
  
  def test_symbol
    assert_equal [:hej, :test], [:test, :hej].sort_natural
  end
end
