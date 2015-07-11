# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

require "sixarm_ruby_ramp/enumerable/each"

class EnumerableEachTest < Minitest::Test

  def test_each_at_with_numeric_with_positive
    assert_equal("a", ["a", "b", "c"].each_at(0))
  end

  def test_each_at_with_numeric_with_negative
    assert_equal("c", ["a", "b", "c"].each_at(-1))
  end

  def test_each_at_with_range_with_positives
    assert_equal(["a", "b"], ["a", "b", "c"].each_at(0..1))
  end

  def test_each_at_with_range_with_negatives
    assert_equal(["c", "b"], ["a", "b", "c"].each_at(-1..-2))
  end

  def test_each_at_with_enumerable_ascending
    assert_equal(["a", "c"], ["a", "b", "c"].each_at([0, 2]))
  end

  def test_each_at_with_enumerable_descending
    assert_equal(["c", "a"], ["a", "b", "c"].each_at([2, 0]))
  end

  def test_each_at_with_worst_case_using_all_of_the_above_tests
    assert_equal("a", ["a", "b", "c"].each_at(0))
    assert_equal("c", ["a", "b", "c"].each_at(-1))
    assert_equal(["a", "b"], ["a", "b", "c"].each_at(0..1))
    assert_equal(["a", "c"], ["a", "b", "c"].each_at([0, 2]))
    assert_equal(["c", "a"], ["a", "b", "c"].each_at([2, 0]))
  end

end
