# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"

class TimeTest < Minitest::Test

 def test_pack_with_class_method
   t=Time.pack
   assert(t=~/^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$/,t)
 end

 def test_pack_with_instance_method
   t=Time.now.pack
   assert(t=~/^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$/,t)
 end


end
