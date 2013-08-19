# -*- coding: utf-8 -*-

# Numeric extensions

class Numeric


  # @return 0 if the given flag is any of: nil, false, 0, [], {}
  #
  # @example
  #   3.if(true) => 3
  #   3.if(false) => 0
  #
  def if(flag)
    if [nil,false,0,[],{}].include?(flag) then 0 else self end
  end


  # @return self if flag is nil, false, 0, [], {}; otherwise return 0.
  #
  # @example
  #   3.unless(true) => 0
  #   3.unless(false) => 3
  #
  def unless(flag)
    if [nil,false,0,[],{}].include?(flag) then self else 0 end
  end


  # @return self as a percent, i.e. * 100 then call round.
  #
  # @example
  #   x = 0.12345
  #   x.percent => 12
  #   x.percent(1) => 12.3
  #   x.percent(2) => 12.34
  #   x.percent(-1) => 10
  #
  def percent(ndigits=0)
    (self * 100).round(ndigits)
  end


  # @return self, truncated to a given precision
  #
  # @example
  #   x = 0.12345
  #   x.floor_precision(0) => 0.0
  #   x.floor_precision(1) => 0.1
  #   x.floor_precision(2) => 0.12
  #   x.floor_precision(3) => 0.123
  #
  def floor_precision(precision)
    return self if is_a?(Float) && nan?
    (self * (10 ** precision)).truncate.fdiv(10 ** precision)
  end

end
