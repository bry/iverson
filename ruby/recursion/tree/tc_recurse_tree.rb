#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './recurse_tree'
require "test/unit"

class TestRecurseTree < Test::Unit::TestCase
  def setup 
    @mgr_hash = {:a=>[:b], :b=>[:c, :d], :c=>[], :d=>[]}
    @space_hash = {:a=>10, :b=>2, :c=>15, :d=>1}
  end

  def test_calc_mgr_space
    expected_result = 28
    manager = :a
    assert_equal(expected_result, calc_mgr_space(manager, @mgr_hash, @space_hash))
    expected_result = 18
    manager = :b
    assert_equal(expected_result, calc_mgr_space(manager, @mgr_hash, @space_hash))
    expected_result = 15 
    manager = :c
    assert_equal(expected_result, calc_mgr_space(manager, @mgr_hash, @space_hash))
    expected_result = 1 
    manager = :d
    assert_equal(expected_result, calc_mgr_space(manager, @mgr_hash, @space_hash))
  end
end
