# -*- coding: utf-8 -*-

class Integer

  # Reverse bit.
  #
  # Example:
  #
  #    0.rbit #=> 0
  #    1.rbit #=> 128
  #    2.rbit #=> 64
  #
  # The bit count defaults to 8.
  #
  # @param count [Integer] the count of bits to reverse
  #
  def rbit(count=8)
    z =  self & 0
    count.times{|i|
      z = z * 2 + self[i]
    }
    z
  end

end
