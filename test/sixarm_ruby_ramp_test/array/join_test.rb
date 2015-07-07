# -*- coding: utf-8 -*-
require "minitest/autorun"
require "sixarm_ruby_ramp/array/join"

class ArrayJoinTest < Minitest::Test

  A=['a','b','c']

  def test_join_with_no_ops
    assert_equal('abc',A.join())
  end

  def test_join_with_1_op_does_infix
    assert_equal('a*b*c', A.join('*'))
  end

  def test_join_with_2_ops_does_prefix_suffix
    assert_equal('[a][b][c]', A.join('[',']'))
  end

  def test_join_with_3_ops_does_prefix_suffix_infix
    assert_equal('[a]*[b]*[c]', A.join('[',']','*'))
  end

  def test_join_with_too_many_ops_raises
    assert_raises(ArgumentError){ A.join('','','','') }
  end

  def test_join_prefix_suffix
    assert_equal('[a][b][c]', A.join_prefix_suffix('[',']'))
  end

  def test_join_prefix_suffix_infix
    assert_equal('[a]*[b]*[c]', A.join_prefix_suffix_infix('[',']','*'))
  end

end
