# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"

class SymbolTest < Minitest::Test

  def test_comparable
    assert_equal(-1,:foo<=>:goo)
    assert_equal( 0,:foo<=>:foo)
    assert_equal( 1,:goo<=>:foo)
  end

end
