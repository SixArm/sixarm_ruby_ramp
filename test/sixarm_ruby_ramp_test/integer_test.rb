# -*- coding: utf-8 -*-
require 'test/unit'
require 'sixarm_ruby_ramp'


class IntegerTest < Test::Unit::TestCase

  def test_maps
    expect=['a','a','a']
    actual=3.maps{'a'}
    assert_equal(expect,actual)
  end

  def test_maps_with_index
    expect=[0,1,2]
    actual=3.maps{|i| i}
    assert_equal(expect,actual)
  end

end
