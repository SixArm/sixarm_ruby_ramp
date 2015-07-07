# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'sixarm_ruby_ramp/enumbar/map'
require 'openstruct'

class EnumerableMapTest < Minitest::Test

  def test_map_id
    x = [OpenStruct(id: 1), OpenStruct(id: 2), OpenStruct(id: 3)]
    assert_equal(x.map(&:id), x.map_id)
  end

  def test_map_to_a
    x = [{a: :b, c: :d}, {e: :f, g: :h}]
    assert_equal(x.map(&:to_a), x.map_to_a)
  end

  def test_map_to_f
    x = ["1", "2", "3"]
    assert_equal(x.map(&:to_f) , x.map_to_f)
  end

  def test_map_to_i
    x = ["1", "2", "3"]
    assert_equal(x.map(&:to_i), x.map_to_i)
  end

  def test_map_to_s
    x = [1, 2, 3]
    assert_equal(x.map(&:to_s), x.map_to_s)
  end

  def test_map_to_sym
    x = ["a", "b", "c"]
    assert_equal(x.map(&:to_sym) , x.map_to_sym)
  end

  def test_map_with_index
    assert_equal(["a0", "b1", "c2"], ["a", "b", "c"].map_with_index{|x,i| "#{x}#{i}"})
  end

end
