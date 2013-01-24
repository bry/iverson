#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './std_dev'
require "test/unit"
 
class TestStandardDeviation < Test::Unit::TestCase
  def test_standard_deviation_calc
    test_numbers = [1,2,3,4]
    std_dev = std_dev(test_numbers)
    assert_equal(1.11803, std_dev(test_numbers).round(5), "#{std_dev}")

    test_numbers = [1,2]
    std_dev = std_dev(test_numbers)
    assert_equal(0.5, std_dev(test_numbers).round(5), "#{std_dev}")

    test_numbers = [1]
    std_dev = std_dev(test_numbers)
    assert_equal(0.0, std_dev(test_numbers).round(5), "#{std_dev}")

    test_numbers = [55,21,123,24,11,1,0]
    std_dev = std_dev(test_numbers)
    assert_equal(40.36214, std_dev(test_numbers).round(5), "#{std_dev}")

    test_numbers = []
    std_dev = std_dev(test_numbers)
    assert_equal(0.0, std_dev(test_numbers).round(5), "#{std_dev}")
  end
end
