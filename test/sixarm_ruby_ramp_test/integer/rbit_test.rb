# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

require "sixarm_ruby_ramp/integer/rbit"

class IntegerTest < Minitest::Test

  def test_width_8_zero
    assert_equal(0,0.rbit(8))
  end

  def test_width_8_one
    assert_equal(128,1.rbit(8))
  end

  def text_width_8_max
    assert_equal(255,255.rbit(8))
  end

  def test_width_16_zero
    assert_equal(0, 0.rbit(16))
  end

  def test_width_16_one
    assert_equal(32768, 1.rbit(16))
  end

  def test_width_16_max
    assert_equal(65535, 65535.rbit(16))
  end

  def test_width_32_zero
    assert_equal(0, 0.rbit(32))
  end

  def test_width_32_one
    assert_equal(2147483648, 1.rbit(32))
  end

  def test_width_32_max
    assert_equal(4294967295, 4294967295.rbit(32))
  end

end
