# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

require "sixarm_ruby_ramp/enumerable/map"
require "ostruct"

class EnumerableSlicerTest < Minitest::Test

  def test_slicer
    x = ["a", "b", "c", "d"]
    assert_equal(["b", "c"], x.slicer(1..2).to_a)
  end

  def test_lazy_slicer
    x = ["a", "b", "c", "d"]
    assert_equal(["b", "c"], x.slicer(1..2).to_a
  end

end
