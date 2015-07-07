# -*- coding: utf-8 -*-

require "date"

# Date extensions

class Date

  # @return [Boolean] true if the date is a weekday: Mon, Tue, Wed, Thu, Fri
  #
  # @example
  #   d = Date.parse('2008-01-01')
  #   d.wday => 2
  #   d.weekday? => true
  
  def weekday?
    wday>0 and wday<6
  end


  # @return [Boolean] true if the date is a weekend: Sat, Sun
  #
  # @example
  #   d = Date.parse('2008-01-05')
  #   d.wday => 6
  #   d.weekend? => true

  def weekend?
    wday==0 or wday==6
  end


  # @return [Date] a random date between min & max
  #
  # @example
  #   d1= Date.parse('2008-01-01')
  #   d2= Date.parse('2009-01-01')
  #   Date.between(d1,d3) => Date 2008-11-22

  def self.between(min,max)
    min+rand(max-min)
  end


  # @return [String] date in a sql format: YYYY-MM-DD
  #
  # @example
  #   d=Date.today
  #   d.to_sql => "2007-12-31"

  def to_sql
    return sprintf("%04d-%02d-%02d",year,month,mday)
  end

end
