# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start

[
  'array',
  'array/join',
  'array/shuffle',
  'class',
  'csv',
  'date',
  'enumerable',
  'enumerable/map',
  'enumerable/nitems',
  'enumerable/select',
  'file',
  'fixnum',
  'hash',
  'integer',
  'integer/rbit',
  'io',
  'kernel',
  'math',
  'nil',
  'numeric',
  'object',
  'pairable',
  'process',
  'string',
  'symbol',
  'time',
  'yaml'
].map{|x|
  require "sixarm_ruby_ramp_test/#{x}_test.rb"
}
