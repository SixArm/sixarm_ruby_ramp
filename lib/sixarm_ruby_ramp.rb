# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

[
  'array',
  'array/join',
  'array/shuffle',
  'class',
  'csv',
  'date',
  'enumerable',
  'enumerable/each',
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
  'time',
  'yaml'
].map{|x|
  require_relative "sixarm_ruby_ramp/#{x}"
}
