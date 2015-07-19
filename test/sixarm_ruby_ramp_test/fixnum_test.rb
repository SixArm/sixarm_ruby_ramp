# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/fixnum"

class FixnumTest < Minitest::Test

  def test_even_with_true
    assert(2.even?)
  end

  def test_even_with_false
    assert(!3.even?)
  end

  def test_odd_with_true
    assert(3.odd?)
  end

  def test_odd_with_false
    assert(!2.odd?)
  end

end
