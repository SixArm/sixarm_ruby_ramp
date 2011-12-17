# -*- coding: utf-8 -*-
require 'test/unit'
require 'sixarm_ruby_ramp'

class NumericTest < Test::Unit::TestCase


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

  
end

