# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/object"

class ObjectTest < Minitest::Test

 def test_in_array
  assert_equal(true,'a'.in?(['a','b','c']))
  assert_equal(false,'x'.in?(['a','b','c']))
 end

end
