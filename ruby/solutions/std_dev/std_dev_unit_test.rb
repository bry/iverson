#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './std_dev'
require "test/unit"
 
class TestStandardDeviation < Test::Unit::TestCase

  def setup

  end

  def test_standard_deviation_calc
    test_numbers = [1,2,3,4]
    std_dev = std_dev(test_numbers)
    assert_equal(1.0, std_dev(test_numbers), "${std_dev}")
  end
end
