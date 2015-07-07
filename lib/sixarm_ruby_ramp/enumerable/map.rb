# -*- coding: utf-8 -*-
module Enumerable

  # Map each item => item.id
  #
  # @return [Enumerable<Object>] an list of each item.id
  #
  # @example
  #   users = User.find(:all)
  #   users.map_id => [1,2,3,4,...]
  #
  # A typical use is to convert a list of ActiveRecord items to a list of id items.
  #
  # This method is a faster way to get the same results as items.map(&:id)
  #
  def map_id
    map{|item| item.id}
  end

  # Map each item => item.to_a
  #
  # @return [Enumberable<Array<Object>>] a list of each item.to_a
  #
  # @example
  #   hashes = [{1=>2, 3=>4},{5=>6, 7=>8}]
  #   hashes.map_to_a => [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
  #
  # This method is a faster way to get the same results as items.map(&:to_a)
  #
  def map_to_a
    map{|item| item.to_a}
  end

  # Map each item => item.to_f
  #
  # @return [Enumerable<Float>] a list of each item.to_f
  #
  # @example
  #   strings = ["1","2","3"]
  #   strings.map_to_f => [1.0, 2.0, 3.0]
  #
  # A typical use is to convert a list of String items to a list of float items.
  #
  # This method is a fast way to get the same results as items.map(&:to_f)
  #
  def map_to_f
    map{|item| item.to_f}
  end

  # Map each item => item.to_i
  #
  # @return [Enumerable<Integer>] a list of each item.to_i
  #
  # @example
  #   strings = ["1","2","3"]
  #   strings.map_to_i => [1, 2, 3]
  #
  # A typical use is to convert a list of String items to a list of integer items.
  #
  # This method is a fast way to get the same results as items.map(&:to_i)
  #
  def map_to_i
    map{|item| item.to_i}
  end

  # Map each item => item.to_s
  #
  # @return [Enumerable<String>] a list of each item.to_s
  #
  # @example
  #   numbers = [1, 2, 3]
  #   numbers.map_to_s => ["1", "2", "3"]
  #
  # A typical use is to convert a list of Numeric items to a list of String items.
  #
  # This method is a fast way to get the same results as items.map(&:to_s)
  #
  def map_to_s
    map{|item| item.to_s}
  end

  # Map each item => item.to_sym
  #
  # @return [Enumerable<Symbol>] a list of each item.to_sym
  #
  # @example
  #   strings = ["foo", "goo", "hoo"]
  #   strings.map_to_sym => [:foo, :goo, :hoo]
  #
  # A typical use is to convert a list of Object items to a list of Symbol items.
  #
  # This method is a fast way to get the same results as items.map(&:to_sym)
  #
  def map_to_sym
    map{|item| item.to_sym}
  end

  # Map each item and its index => a new output
  #
  # @return [Enumerable<Object>] an list of each item transformed by the block
  # @see Enumerable#map
  # @see Enumerable#each_with_index
  #
  # @example
  #   strings = ["a", "b", "c"]
  #   strings.map_with_index{|string,index| "#{string}#{index}"}
  #    => ["a0, "b1", "c3"]
  #
  def map_with_index
    index=-1
    map{|item| index+=1; yield(item,index)}
  end

end
