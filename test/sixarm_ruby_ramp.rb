# -*- coding: utf-8 -*-
require 'test/unit'

['array','class','csv','date','enumerable','file','fixnum','hash','integer','io','kernel','math','nil','numeric','object','process','string','symbol','time','xml','yaml'].map{|x|
  require "sixarm_ruby_ramp/#{x}_test.rb"
}

