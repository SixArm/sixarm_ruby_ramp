# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'sixarm_ruby_ramp'

class PairableTest < Minitest::Test

  def test_sort_by_keys
    h = {'c' => 'z', 'b' => 'y', 'a' => 'x'}
    assert_equal({'a' => 'x', 'b' => 'y', 'c' => 'z'}, h.sort_by_keys)
  end

  def test_each_sort
    out = []
    h = {'c' => 'z', 'b' => 'y', 'a' => 'x'}
    h.each_sort{|key,val| out << key.upcase; out << val.upcase}
    assert_equal(['A','X','B','Y','C','Z'], out)
  end

  def test_each_sort_with_empty
    out = []
    h = {}
    h.each_sort{|key,val| out << key.upcase; out << val.upcase}
    assert_equal([], out)
  end

  def test_each_key_bang
    actual = { "a" => "b", "c" => "d" }
    expect = { "A" => "b", "C" => "d" }
    actual.each_key! {|key| key.upcase }
    assert_equal(expect,actual)
  end

  def test_each_key_bang_with_empty
    actual = {}
    expect = {}
    actual.each_key! {|key| key.upcase }
    assert_equal(expect,actual)
  end

  def test_each_pair_bang
    actual = { "a" => "b", "c" => "d" }
    expect = { "A" => "B", "C" => "D" }
    actual.each_pair! {|key,value| [key.upcase, value.upcase] }
    assert_equal(expect,actual)
  end

  def test_each_pair_bang_with_empty
    actual = {}
    expect = {}
    actual.each_pair! {|key,value| [key.upcase, value.upcase] }
    assert_equal(expect,actual)
  end

  def test_each_pair_bang_with_same_key_different_value
    actual = { "a" => "b", "c" => "d" }
    expect = { "a" => "B", "c" => "D" }
    actual.each_pair! {|key,value| [key, value.upcase] }
    assert_equal(expect,actual)
  end

  def test_each_pair_bang_with_same_key_same_value
    actual = { "a" => "b", "c" => "d" }
    expect = { "a" => "b", "c" => "d" }
    actual.each_pair! {|key,value| [key, value] }
    assert_equal(expect,actual)
  end

  def test_each_value_bang
    actual = { "a" => "b", "c" => "d" }
    expect = { "a" => "B", "c" => "D" }
    actual.each_value! {|value| value.upcase }
    assert_equal(expect,actual)
  end

  def test_each_value_bang_with_empty
    actual = {}
    expect = {}
    actual.each_value! {|value| value.upcase }
    assert_equal(expect,actual)
  end

  def test_map_key
    h={"a"=>"b", "c"=>"d"}
    expect={"A"=>"b", "C"=>"d"}
    actual=h.map_key{|key| key.upcase }
    assert_equal(expect,actual,h.inspect)
  end

  def test_map_value
    h={"a"=>"b", "c"=>"d"}
    expect={"a"=>"B", "c"=>"D"}
    actual=h.map_value{|value| value.upcase }
    assert_equal(expect,actual,h.inspect)
  end

  def test_map_pair
    h={"a"=>"b", "c"=>"d"}
    expect={"A"=>"B", "C"=>"D"}
    actual=h.map_pair{|key,value| [key.upcase, value.upcase] }
    assert_equal(expect,actual,h.inspect)
  end

  def test_yield_pair
    h = {"a"=>"b", "c"=>"d" }
    expect=["ab","cd"]
    actual=h.yield_pair{|key,value| key+value }
    assert_equal(expect,actual,h.inspect)
  end

  def test_yield_pair_with_empty
    h = {}
    expect=[]
    actual=h.yield_pair{|key,value| key+value }
    assert_equal(expect,actual,h.inspect)
  end

end
