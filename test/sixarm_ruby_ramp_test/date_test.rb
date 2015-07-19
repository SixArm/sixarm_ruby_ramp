# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"

class DateTest < Minitest::Test


  def test_weekday
    # Start on Monday, January 1, 2007
    assert( Date.new(2007,1,1).weekday?)
    assert( Date.new(2007,1,2).weekday?)
    assert( Date.new(2007,1,3).weekday?)
    assert( Date.new(2007,1,4).weekday?)
    assert( Date.new(2007,1,5).weekday?)
    assert(!Date.new(2007,1,6).weekday?)
    assert(!Date.new(2007,1,7).weekday?)
    assert( Date.new(2007,1,8).weekday?)
  end


  def test_weekend
    # Start on Monday, January 1, 2007
    assert(!Date.new(2007,1,1).weekend?)
    assert(!Date.new(2007,1,2).weekend?)
    assert(!Date.new(2007,1,3).weekend?)
    assert(!Date.new(2007,1,4).weekend?)
    assert(!Date.new(2007,1,5).weekend?)
    assert( Date.new(2007,1,6).weekend?)
    assert( Date.new(2007,1,7).weekend?)
    assert(!Date.new(2007,1,8).weekend?)
  end


  def test_to_sql_with_non_zero_month_and_mday
    assert_equal('2007-12-31',Date.new(2007,12,31).to_sql)
  end


  def test_to_sql_with_zero_month_and_mday
    assert_equal('2007-01-02',Date.new(2007,1,2).to_sql)
  end


  def test_between
    d1= Date.parse('2008-01-01')
    d2= Date.parse('2009-01-01')
    d3= Date.between(d1,d2)
    assert(d3>=d1)
    assert(d3<=d2)
  end


  def self.between(min,max)
    min+rand(max-min)
  end


end
