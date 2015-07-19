# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/numeric"

class NumericTest < Minitest::Test


  def test_if_with_true
    assert_equal(5,5.if(true))
  end


  def test_if_with_false
    assert_equal(0,5.if(false))
  end


  def test_unless_with_true
    assert_equal(0,5.unless(true))
  end


  def test_unless_with_false
    assert_equal(5,5.unless(false))
  end


  def test_percent_with_ndigits_default
    assert_equal(12, (0.1234).percent)
  end


  def test_percent_with_ndigits_zero
    assert_equal(12, (0.1234).percent(0))
  end


  def test_percent_with_ndigits_positive
    assert_equal(12.3, (0.1234).percent(1))
  end


  def test_percent_with_ndigits_negative
    assert_equal(10, (0.1234).percent(-1))
  end


  def test_floor_precision
    x = 0.12345
    assert_equal(0.0, x.floor_precision(0))
    assert_equal(0.1, x.floor_precision(1))
    assert_equal(0.12, x.floor_precision(2))
    assert_equal(0.123, x.floor_precision(3))
  end


end
