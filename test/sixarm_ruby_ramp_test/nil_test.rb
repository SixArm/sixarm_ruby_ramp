# -*- coding: utf-8 -*-
require "minitest/autorun"
require "sixarm_ruby_ramp"

class NilTest < Minitest::Test

 def test_blank
  assert_equal(true,nil.blank?)
 end

 def test_size
  assert_equal(false,nil.size?)
 end

end

