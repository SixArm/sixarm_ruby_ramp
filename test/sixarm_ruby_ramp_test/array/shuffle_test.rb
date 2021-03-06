# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"

class ArrayTest < Minitest::Test

  def test_shuffle
    a=[1,2,3,4]
    5.times {
      b=a.shuffle
      assert_equal(a.size,b.size)
      a.each{|item| assert(b.include?(item)) }
    }
  end

  def test_shuffle_bang
    a=[1,2,3,4]
    b=a.dup
    5.times {
      b.shuffle!
      assert_equal(a.size,b.size)
      a.each{|item| assert(b.include?(item)) }
    }
  end

end
