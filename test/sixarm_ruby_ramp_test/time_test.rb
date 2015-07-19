# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "sixarm_ruby_ramp/time"

class TimeTest < Minitest::Test

 def test_stamp_with_class_method
   t=Time.stamp
   assert(t=~/^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\dZ$/,t)
 end

 def test_stamp_with_instance_method
   t=Time.now.stamp
   assert(t=~/^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\dZ$/,t)
 end

 def test_pack_with_class_method
   t=Time.pack
   assert(t=~/^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$/,t)
 end

 def test_pack_with_instance_method
   t=Time.now.pack
   assert(t=~/^\d\d\d\d\d\d\d\d\d\d\d\d\d\d$/,t)
 end


end
