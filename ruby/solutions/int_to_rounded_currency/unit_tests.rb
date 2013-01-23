#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './int_to_rounded'
require "test/unit"

class TestIntToRounded < Test::Unit::TestCase
  def test_to_rounded_s
    assert_equal("$0", 0.to_rounded_s )
    assert_equal("$140", 140.to_rounded_s )
    assert_equal("$1.2K", 1240.to_rounded_s )
    assert_equal("$78K", 78192.to_rounded_s )
    assert_equal("$501K", 501200.to_rounded_s )
    assert_equal("($1.2M)", -1240123.to_rounded_s )
    assert_equal("$5.9B", 5853010238.to_rounded_s )
    # Additional test cases
    assert_equal("$124T", 124123000121002.to_rounded_s )
    assert_equal("$999T", 999123000121002.to_rounded_s )
    assert_equal("$999T", 999923000121002.to_rounded_s )
    assert_equal("$11M", 11234322.to_rounded_s )
    assert_equal("$121M", 121234322.to_rounded_s )
    assert_equal("$14B", 14121234322.to_rounded_s )
    assert_equal("$321B", 321121234322.to_rounded_s )
    assert_equal("$9.2T", 9223000121002.to_rounded_s )
    assert_equal("$34T", 34223000121002.to_rounded_s )
    assert_equal("$Number out of range", 111119223000121002.to_rounded_s )
  end

  def test_brute_force_to_rounded_s
    puts "Testing 10M - all numbers from range"
    (10000000..10999999).each do |x|
      assert_equal("$10M", x.to_rounded_s )
    end
  end

  def test_random_number_range_to_rounded_s
    max_iterations = 2500000
    puts "Testing 100T - #{max_iterations} random selections from range"
    for i in 0..max_iterations
      x = Random.rand(100000000000000..100999999999999)
      assert_equal("$100T", x.to_rounded_s )
    end
  end
end
