# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

['array','class','csv','date','enumerable','file','fixnum','hash','integer','integer/rbit','io','kernel','math','nil','numeric','object','pairable','process','string','symbol','time','xml','yaml'].map{|x|
  require File.dirname(__FILE__) + "/sixarm_ruby_ramp/#{x}.rb"
}
