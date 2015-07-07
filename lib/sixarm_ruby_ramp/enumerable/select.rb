# -*- coding: utf-8 -*-
module Enumerable

  # @example
  #   enum.select_while {|obj| block }
  #    => array
  #
  # @return [Array<Object>] the leading elements for which block is not false or nil.
  #
  def select_while
    arr = []
    each{|item| yield(item) ? (arr << item) : break}
    return arr
  end

  # @example
  #   enum.select_until {|obj| block }
  #    => array
  #
  # @return [Array<Object>] the leading elements for which block is false or nil.
  #
  def select_until
    arr = []
    each{|item| yield(item) ? break : (arr << item)}
    return arr
  end

  # Calls block with two arguments, the item and its index, for each item in enum.
  #
  # @example
  #   enum.select_with_index {|obj,i| block }
  #   => array
  #
  # @return [Array<Object> the leading elements for which block is not false or nil.
  #
  def select_with_index
    index = 0
    arr = []
    each{|item|
      if yield(item,index)
        arr << item
        index+=1
      else
        break
      end
    }
    return arr
  end

end
