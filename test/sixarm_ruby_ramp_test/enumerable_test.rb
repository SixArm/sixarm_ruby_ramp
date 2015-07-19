# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/enumerable"

class EnumerableTest < Minitest::Test

  ITEMS = ['a','b','c']
  RGB = ["red","green","blue"]  # to test case changes


  ########################################################################
  #
  #  typecast
  #
  ########################################################################


  def test_to_h_with_unique_keys
    a=[[:a,:b],[:c,:d],[:e,:f]]
    assert_equal({:a=>:b, :c=>:d, :e=>:f}, a.to_h)
  end

  def test_to_h_with_duplicate_keys
    a=[[:a,:b],[:a,:c],[:a,:d]]
    assert_equal({:a=>:d}, a.to_h)
  end

  def test_to_h_merge_with_unique_keys
    a=[[:a,:b],[:c,:d],[:e,:f]]
    assert_equal({:a=>:b, :c=>:d, :e=>:f}, a.to_h_merge)
  end

  def test_to_h_merge_with_duplicate_keys
    a=[[:a,:b],[:a,:c],[:a,:d]]
    assert_equal({:a=>[:b, :c, :d]}, a.to_h_merge)
  end

  def test_index_by
    assert_equal({3=>"red",4=>"blue",5=>"green"},RGB.index_by{|x| x.size})
  end

  def test_hash_by
    assert_equal({3=>"RED",4=>"BLUE",5=>"GREEN"},RGB.hash_by{|x| [x.size,x.upcase]})
  end


  ########################################################################
  #
  #  bisect
  #
  ########################################################################

  def test_bisect
    assert_equal([[           ],['a','b','c']],ITEMS.bisect{|x| x < 'a' },'< a')
    assert_equal([['a'        ],[    'b','c']],ITEMS.bisect{|x| x < 'b' },'< b')
    assert_equal([['a','b'    ],[        'c']],ITEMS.bisect{|x| x < 'c' },'< c')
    assert_equal([['a','b','c'],[           ]],ITEMS.bisect{|x| x < 'd' },'< d')
  end


  ########################################################################
  #
  #  mutex?
  #
  ########################################################################

  def test_mutex
    assert_equal(true,  ITEMS.mutex?{|x| x < 'a'})
    assert_equal(true,  ITEMS.mutex?{|x| x < 'b'})
    assert_equal(false, ITEMS.mutex?{|x| x < 'c'})
    assert_equal(false, ITEMS.mutex?{|x| x < 'd'})
  end


  ########################################################################
  #
  #  strings
  #
  ########################################################################


  def test_join_0
    a='a'..'c'
    assert_equal("abc",a.join,"join()")
  end

  def test_join_1
    a='a'..'c'
    assert_equal("a+b+c",a.join('+'),"join('+')")
  end

  def test_join_2
    a='a'..'c'
    assert_equal("+a-+b-+c-",a.join("+","-"),"join('+','-')")
  end


  ########################################################################
  #
  #  set math
  #
  ########################################################################

  def test_intersect_true
    assert_equal(true,['a','b'].intersect?(['b','c']))
  end

  def test_intersect_true_with_same
    assert_equal(true,['a','b'].intersect?(['a','b']))
  end

  def test_intersect_false
    assert_equal(false,['a','b'].intersect?(['c','d']))
  end

  def test_intersect_false_with_none
    assert_equal(false,['a','b','c'].intersect?([]))
  end

  CARTESIAN_PRODUCT_EXPECT=[["a", "d", "g"],
                            ["a", "d", "h"],
                            ["a", "d", "i"],
                            ["a", "e", "g"],
                            ["a", "e", "h"],
                            ["a", "e", "i"],
                            ["a", "f", "g"],
                            ["a", "f", "h"],
                            ["a", "f", "i"],
                            ["b", "d", "g"],
                            ["b", "d", "h"],
                            ["b", "d", "i"],
                            ["b", "e", "g"],
                            ["b", "e", "h"],
                            ["b", "e", "i"],
                            ["b", "f", "g"],
                            ["b", "f", "h"],
                            ["b", "f", "i"],
                            ["c", "d", "g"],
                            ["c", "d", "h"],
                            ["c", "d", "i"],
                            ["c", "e", "g"],
                            ["c", "e", "h"],
                            ["c", "e", "i"],
                            ["c", "f", "g"],
                            ["c", "f", "h"],
                            ["c", "f", "i"]]

  def test_cartesian_product_class_method
    a1=['a','b','c']
    a2=['d','e','f']
    a3=['g','h','i']
    actual=Enumerable.cartesian_product(a1,a2,a3)
    assert_equal(CARTESIAN_PRODUCT_EXPECT,actual,'class method')
  end

  def test_cartesian_product_instance_method
    a1=['a','b','c']
    a2=['d','e','f']
    a3=['g','h','i']
    actual=a1.cartesian_product(a2,a3)
    assert_equal(CARTESIAN_PRODUCT_EXPECT,actual,'instance method')
  end

  def test_power_set
    a=['a','b','c']
    expect=[[],['a'],['a','b'],['a','b','c'],['a','c'],['b'],['b','c'],['c']]
    actual=a.power_set.sort
    assert_equal(expect,actual)
  end

end
