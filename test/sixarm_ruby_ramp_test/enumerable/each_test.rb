# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

require "sixarm_ruby_ramp/enumerable/each"

class EnumerableEachTest < Minitest::Test

  LIST = ["a", "b", "c", "d", "e", "f"]

  ### #each_at

  def test_each_at_with_numeric_positive
    filter = 1
    expect = ["b"]
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_numeric_negative
    filter = -1
    expect = ["f"]
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_enumerable_positives_asendining
    filter = [1, 2]
    expect = ["b", "c"]
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_enumerable_positives_descending
    filter = [2, 1]
    expect = ["c", "b"]  # Note: order depends on filter, not LIST, because the strategy uses filter#each.
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_enumerable_negatives_ascending
    filter = [-2, -1]
    expect = ["e", "f"]
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_enumerable_negatives_descending
    filter = [-1, -2]
    expect = ["f", "e"]  # Note: order depends on filter, not LIST, because the strategy uses filter#each.
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_range_positives_ascending
    filter = 1..2
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_range_positives_descending
    filter = 2..1
    expect = []   # Degenerate because filter#each will noop.
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_range_negatives_ascending
    filter = -2..-1
    expect = ["e", "f"]
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_with_range_negatives_descending
    filter = -1..-2
    expect = []  # Degenerate because filter#each will noop.
    actual = []
    LIST.each_at(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  ### #each_at_strategy_with_optimization_off

  def test_each_at_strategy_with_optimization_off_with_numeric_positive
    filter = [1]  # Note: must be wrapped in an array because the strategy presumes filter#include?.
    expect = ["b"]
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_numeric_negative
    filter = [-1]  # Note: must be wrapped in an array because the strategy 0 presumes filter#include?.
    expect = ["f"]
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_enumerable_positives_asendining
    filter = [1, 2]
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_enumerable_positives_descending
    filter = [2, 1]
    expect = ["b", "c"]  # Note: order depends on LIST, not filter, because the strategy uses filter#include?.
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_enumerable_negatives_ascending
    filter = [-2, -1]
    expect = ["e", "f"]
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_enumerable_negatives_descending
    filter = [-1, -2]
    expect = ["e", "f"]  # Note: order depends on LIST, not filter, because the strategy uses filter#include?.
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_range_positives_ascending
    filter = 1..2
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_range_positives_descending
    filter = 2..1
    expect = []   # Degenerate because filter#include? will always be false.
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_range_negatives_ascending
    filter = -2..-1
    expect = ["e", "f"]
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_off_with_range_negatives_descending
    filter = -1..-2
    expect = []  # Degenerate because filter#include? will always be false.
    actual = []
    LIST.each_at_strategy_with_optimization_off(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  ### #each_at_strategy_with_optimization_min

  def test_each_at_strategy_with_optimization_min_with_numeric_positive
    filter = [1]  # Note: must be wrapped in an array because the strategy presumes filter#each.
    expect = ["b"]
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_numeric_negative
    filter = [-1]  # Note: must be wrapped in an array because then strategy presumes filter#each.
    expect = ["f"]
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_enumerable_positives_asendining
    filter = [1, 2]
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_enumerable_positives_descending
    filter = [2, 1]
    expect = ["c", "b"]  # Note: order depends on filter, not LIST, because the strategy uses filter#each.
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_enumerable_negatives_ascending
    filter = [-2, -1]
    expect = ["e", "f"]
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_enumerable_negatives_descending
    filter = [-1, -2]
    expect = ["f", "e"]  # Note: order depends on filter, not LIST, because the strategy uses filter#each.
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_range_positives_ascending
    filter = 1..2
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_range_positives_descending
    filter = 2..1
    expect = []   # Degenerate because filter#each will noop.
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_range_negatives_ascending
    filter = -2..-1
    expect = ["e", "f"]
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_min_with_range_negatives_descending
    filter = -1..-2
    expect = []  # Degenerate because filter#each will noop.
    actual = []
    LIST.each_at_strategy_with_optimization_min(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  ### #each_at_strategy_with_optimization_max

  def test_each_at_strategy_with_optimization_max_with_numeric_positive
    filter = [1]  # Note: must be wrapped in an array because the strategy presumes filter#each.
    expect = ["b"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_numeric_negative
    filter = [-1]  # Note: must be wrapped in an array because then strategy presumes filter#each.
    expect = ["f"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_enumerable_positives_asendining
    filter = [1, 2]
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_enumerable_positives_descending
    filter = [2, 1]
    expect = ["c", "b"]  # Note: order depends on filter, not LIST, because the strategy uses filter#each.
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_enumerable_negatives_ascending
    filter = [-2, -1]
    expect = ["e", "f"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_enumerable_negatives_descending
    filter = [-1, -2]
    expect = ["f", "e"]  # Note: order depends on filter, not LIST, because the strategy uses filter#each.
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_range_positives_ascending
    filter = 1..2
    expect = ["b", "c"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_range_positives_descending
    filter = 2..1
    expect = []   # Degenerate because filter#each will noop.
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_range_negatives_ascending
    filter = -2..-1
    expect = ["e", "f"]
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

  def test_each_at_strategy_with_optimization_max_with_range_negatives_descending
    filter = -1..-2
    expect = []  # Degenerate because filter#each will noop.
    actual = []
    LIST.each_at_strategy_with_optimization_max(filter){|o| actual << o}
    assert_equal(expect, actual)
  end

end
