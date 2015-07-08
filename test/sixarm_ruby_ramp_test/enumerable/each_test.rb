# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

require "sixarm_ruby_ramp/enumerable/each"

class EnumerableEachTest < Minitest::Test

  def test_map_id
    x = [OpenStruct.new(id: 1), OpenStruct.new(id: 2), OpenStruct.new(id: 3)]
    assert_equal(x.map(&:id), x.map_id)
  end

end
