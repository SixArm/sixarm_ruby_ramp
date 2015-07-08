# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

require "sixarm_ruby_ramp/enumerable/nitems"

class EnumerableNItemsTest < Minitest::Test

  ITEMS = ['a','b','c']

  def test_nitems?
    assert_equal(true,  ITEMS.nitems?(0){|x| x < 'a'})
    assert_equal(false, ITEMS.nitems?(1){|x| x < 'a'})
    assert_equal(false, ITEMS.nitems?(2){|x| x < 'a'})
    assert_equal(false, ITEMS.nitems?(0){|x| x < 'b'})
    assert_equal(true,  ITEMS.nitems?(1){|x| x < 'b'})
    assert_equal(false, ITEMS.nitems?(2){|x| x < 'b'})
    assert_equal(false, ITEMS.nitems?(0){|x| x < 'c'})
    assert_equal(false, ITEMS.nitems?(1){|x| x < 'c'})
    assert_equal(true,  ITEMS.nitems?(2){|x| x < 'c'})
  end


  def test_nitems_while
    assert_equal(0,ITEMS.nitems_while{|x| x < 'a' },'< a')
    assert_equal(1,ITEMS.nitems_while{|x| x < 'b' },'< b')
    assert_equal(2,ITEMS.nitems_while{|x| x < 'c' },'< c')
    assert_equal(3,ITEMS.nitems_while{|x| x < 'd' },'< d')
    assert_equal(3,ITEMS.nitems_while{|x| x < 'e' },'< e')
  end


  def test_nitems_until
    assert_equal(0,ITEMS.nitems_until{|x| x == 'a' },'a')
    assert_equal(1,ITEMS.nitems_until{|x| x == 'b' },'b')
    assert_equal(2,ITEMS.nitems_until{|x| x == 'c' },'c')
    assert_equal(3,ITEMS.nitems_until{|x| x == 'd' },'d')
    assert_equal(3,ITEMS.nitems_until{|x| x == 'e' },'e')
  end


  def test_nitems_with_index
    assert_equal(0,ITEMS.nitems_with_index{|x,i| i < 0 },'i < 0')
    assert_equal(1,ITEMS.nitems_with_index{|x,i| i < 1 },'i < 1')
    assert_equal(2,ITEMS.nitems_with_index{|x,i| i < 2 },'i < 2')
    assert_equal(3,ITEMS.nitems_with_index{|x,i| i < 3 },'i < 3')
    assert_equal(3,ITEMS.nitems_with_index{|x,i| i < 4 },'i < 4')
  end

end
