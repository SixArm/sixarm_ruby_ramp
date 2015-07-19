# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/enumerable/select"

class EnumerableSelectTest < Minitest::Test

  ITEMS = ['a','b','c']

  def test_select_while
    assert_equal([           ], ITEMS.select_while{|x| x < 'a' },'< a')
    assert_equal(['a'        ], ITEMS.select_while{|x| x < 'b' },'< b')
    assert_equal(['a','b'    ], ITEMS.select_while{|x| x < 'c' },'< c')
    assert_equal(['a','b','c'], ITEMS.select_while{|x| x < 'd' },'< d')
    assert_equal(['a','b','c'], ITEMS.select_while{|x| x < 'e' },'< e')
  end

  def test_select_until_condition
    assert_equal([           ], ITEMS.select_until{|x| x == 'a' },'a')
    assert_equal(['a'        ], ITEMS.select_until{|x| x == 'b' },'b')
    assert_equal(['a','b'    ], ITEMS.select_until{|x| x == 'c' },'c')
    assert_equal(['a','b','c'], ITEMS.select_until{|x| x == 'd' },'d')
    assert_equal(['a','b','c'], ITEMS.select_until{|x| x == 'e' },'e')
  end

  def test_select_with_index
    assert_equal([           ], ITEMS.select_with_index{|x,i| i < 0 },'i < 0')
    assert_equal(['a'        ], ITEMS.select_with_index{|x,i| i < 1 },'i < 1')
    assert_equal(['a','b'    ], ITEMS.select_with_index{|x,i| i < 2 },'i < 2')
    assert_equal(['a','b','c'], ITEMS.select_with_index{|x,i| i < 3 },'i < 3')
    assert_equal(['a','b','c'], ITEMS.select_with_index{|x,i| i < 4 },'i < 4')
  end

end
