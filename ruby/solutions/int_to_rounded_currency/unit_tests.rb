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
    assert_equal("$11M", 11234322.to_rounded_s )
    assert_equal("$121M", 121234322.to_rounded_s )
    assert_equal("$14B", 14121234322.to_rounded_s )
    assert_equal("$321B", 321121234322.to_rounded_s )
    assert_equal("$9.2T", 9223000121002.to_rounded_s )
  end
end
