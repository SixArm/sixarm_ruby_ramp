# -*- coding: utf-8 -*-
require 'minitest/autorun'
Minitest::Test ||= MiniTest::Unit::TestCase
require 'simplecov'
SimpleCov.start

['array','class','csv','date','enumerable','file','fixnum','hash','integer','io','kernel','math','nil','numeric','object','pairable','process','string','symbol','time','xml','yaml'].map{|x|
  require "sixarm_ruby_ramp_test/#{x}_test.rb"
}
