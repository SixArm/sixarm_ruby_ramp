# -*- coding: utf-8 -*-
module Enumerable

  # @example
  #   enum.nitems?(n) {| obj | block }
  #    => true iff the block is not false or nil num times
  #
  # @return [Boolean] true iff the block is not false or nil num times
  #
  def nitems?(n)
    num = 0
    each{|item|
      if yield(item)
        num+=1
        if num > n then return false end
      end
    }
    return num==n
  end

  # @example
  #   enum.nitems_while {| obj | block }
  #    => number of items
  #
  # @return [Integer] the number of leading elements for which block is not false or nil.
  #
  def nitems_while
    num = 0
    each{|item| yield(item) ? (num+=1) : break}
    return num
  end

  # @example
  #   enum.nitems_until {| obj | block }
  #   => number of items
  #
  # @return [Integer] the number of leading elements for which block is false.
  #
  def nitems_until
    num = 0
    each{|item|
      if yield(item)
        break
      else
        num+=1
      end
    }
    return num
  end


  # Calls block with two arguments, the item and its index, for each item in enum.
  #
  # @example
  #   enum.nitems_with_index {|obj,i| block }
  #    => number of items
  #
  # @return [Integer] the number of leading elements for which block is true.
  #
  def nitems_with_index
    index = 0
    each{|item| yield(item,index) ? (index+=1) : break}
    return index
  end

end
