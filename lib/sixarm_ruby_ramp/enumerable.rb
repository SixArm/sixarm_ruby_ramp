# -*- coding: utf-8 -*-
# Enumerable extensions

require "set"
module Enumerable

  ########################################################################
  #
  #  typecast
  #
  ########################################################################

  # Convert an enumerable to a hash.
  #
  # @return [Hash<Object,Object>] a hash of the enumerable's items
  #
  # @example
  #   array=[[:a, :b],[:c, :d],[:e, :f]]
  #   array.to_h => {:a=>:b, :c=>:d, :e=>:f}
  #
  if !Enumerable.instance_methods.include?:to_h
    def to_h
      hash={}
      each{|key,val|
        hash[key]=val
      }
      return hash
    end
  end

  # Convert an enumerable to a hash and merge values.
  #
  # @return [Hash<Object,Object>] a hash of the enumerable's items
  #
  # @example
  #   array=[[:a, :b],[:c, :d],[:e, :f]]
  #   array.to_h => {:a=>:b, :c=>:d, :e=>:f}
  #
  # If a key occurs more than once, then this will automatically
  # merge the values to an array of the keys' values.
  #
  # @example
  #   array=[[:a,:b],[:a,:c],[:a,:d]]
  #   array.to_h => {:a=>[:b, :c, :d]}
  #
  def to_h_merge
    hash={}
    seen=Set.new
    each{|key,val|
      if hash.key? key
        if seen.include? key
          hash[key] << val
        else
          hash[key]=[hash[key]]
          hash[key] << val
          seen << key
        end
      else
        hash[key]=val
      end
    }
    return hash
  end

  # Convert the enumerable to a hash by mapping each item to a pair [index ,item]
  #
  # @return [Hash<Integer,Object>] a hash of the enumerable's items
  #
  # @example
  #   strings = ["red","blue","green"]
  #   strings.index_by{|a| a.size]}
  #   => {3 => "red", 4 => "blue", 5 => "green"}
  #
  # Rails has this method.
  #
  # From http://stackoverflow.com/questions/412771/cleanest-way-to-create-a-hash-from-an-array
  #
  # @see #hash_by
  #
  def index_by
    inject({}) {|hash, elem| hash.merge!(yield(elem) => elem) }
  end

  # Convert the enumerable to a hash by mapping each item to a pair [item, new item]
  #
  # @return [Hash<Object,Object>] a hash of the enumerable's items
  #
  # @example
  #   strings = ["red","blue","green"]
  #   strings.hash_by{|a| [a.size, a.upcase]}
  #   => {3 => "RED", 4 => "BLUE", 5 => "GREEN"}
  #
  # @see #index_by
  #
  def hash_by
    map{|item| yield(item)}.to_h
  end

  ########################################################################
  #
  #  bisect
  #
  ########################################################################

  # @example
  #   enum.bisect {|obj| block}
  #   => array of positives, array of negatives
  #
  # @return [Array<Array<Object>] an array of two arrays:
  #    the first array is the elements for which block is true,
  #    the second array is the elements for which block is false or nil.
  #
  def bisect
    accept=[]
    reject=[]
    each{|item|
     if yield(item)
      accept << item
     else
      reject << item
     end
    }
    return accept,reject
  end

  ########################################################################
  #
  #  mutually exclusive?
  #
  ########################################################################

  # @example
  #   enum.mutex? {|obj| block}
  #   => true iff block is not false or nil, zero or one time
  #
  # @return boolean true iff block is not false or nil, zero or one time
  #
  def mutex?
    num = 0
    each{|item|
      if yield(item)
        num += 1
        if num > 1 then return false end
      end
    }
    return true
  end

  ########################################################################

  # Shortcut to Array#join to concatenate the items into a string
  #
  # @example
  #   ["foo", "goo", "hoo"].join
  #   => "foogoohoo"
  #
  # @return [String] concatenated string
  #
  # @see Array#join
  #
  def join(*op)
   to_a.join(*op)
  end

  ########################################################################
  #
  #  set math
  #
  ########################################################################

  # @return [Boolean] true if this  _enum_ intersects another _enum_.
  #
  # A developer may want to optimize this implementation for
  # other classes, such as detecting whether a range intersects
  # another range simply by comparing the ranges' min/max values.
  #
  # @example
  #   ['a','b','c'].intersect?(['c','d','e'] => true
  #   ['a','b','c'].intersect?(['d','e','f'] => false
  #
  def intersect?(enum)
    return enum.any?{|item| self.include?(item)}
  end

  # @return [Array] the cartesian product of the enumerations.
  #
  # @see http://en.wikipedia.org/wiki/Cartesian_product
  #
  # This is the fastest implementation we have found.
  # It returns results in typical order.
  #
  # @author Thomas Hafner
  # @see http://www.ruby-forum.com/topic/95519
  #
  # For our benchmarks, we also compared these:
  # - By William James, http://www.ruby-forum.com/topic/95519
  # - By Brian Schröäer, http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/151857
  #
  def self.cartesian_product(*enums)
    result = [[]]
    while [] != enums
      t, result = result, []
      b, *enums = enums
      t.each do |a|
        b.each do |n|
          result << a + [n]
        end
      end
    end
    result
  end

  # Calculate the cartesian product.
  #
  def cartesian_product(*enums)
    Enumerable.cartesian_product(self,*enums)
  end

  # Calculate the power set.
  #
  # @return [Array<Array<Object>>] the power set: an array with all subsets of the enum's elements.
  # @see http://en.wikipedia.org/wiki/Power_set
  #
  # This implementation is from the blog post below:
  # @see http://johncarrino.net/blog/2006/08/11/powerset-in-ruby/
  #
  # @example
  #   [1,2,3].power_set.sort
  #   =>  [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]
  #
  def power_set
    inject([[]]){|c,y|r=[];c.each{|i|r<<i;r<<i+[y]};r}
  end

end
