# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/integer"

class IntegerTest < Minitest::Test

  def test_maps
    expect=['a','a','a']
    actual=3.maps{'a'}
    assert_equal(expect,actual)
  end

  def test_maps_with_index
    expect=[0,2,4]
    actual=3.maps{|i| i * 2}
    assert_equal(expect,actual)
  end

end
