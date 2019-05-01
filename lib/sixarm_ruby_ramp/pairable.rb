# -*- coding: utf-8 -*-

# Extensions for a class that provides key-value pairs.
#
# The including class must provide these methods:
#
#  * obj[key] → value
#  * obj[key] = value
#  * keys → enumerable
#
module Pairable

  # Call block once for each key-value pair in self,
  # passing the key and value to the block
  # as a two-element array.
  #
  # The keys are sorted.
  #
  # @example
  #   h = { "c" => "d", "a" => "b" }
  #   h.each_sort {|key, val| ... }
  #   => calls the block with "a" => "b", then with "c" => "d"
  #
  def each_sort
    keys.sort.each{|key| yield key, self[key] }
  end

  # Call block once for each key-value pair in self,
  # passing the key as a parameter,
  # and updating it in place.
  #
  # @example
  #   h = { "a" => "b", "c" => "d" }
  #   h.each_key! {|key| key.upcase }
  #   h => { "A" => "b", "C" => "d" }
  #
  # @return self
  #
  def each_key!
    replacements=[]
    keys.each{|key|
      value=self[key]
      key2=yield(key)
      if key===key2
        #nop
      else
        replacements << [key,key2,value]
      end
    }
    replacements.each{|key,key2,value|
      self.delete(key)
      self[key2]=value
    }
    return self
  end

  # Call block once for each key-value pair in self,
  # passing the value as a parameter,
  # and updating it in place.
  #
  # @example
  #   h = { "a" => "b", "c" => "d" }
  #   h.each_value! {|value| value.upcase }
  #   h => { "a" => "B", "c" => "d" }
  #
  # @return self
  #
  def each_value!
    keys.each{|key|
      value=self[key]
      value2=yield(value)
      if value===value2
        #nop
      else
        self[key]=yield(value)
      end
    }
    return self
  end

  # Call block once for each key-value pair in self,
  # passing the key and value as parameters,
  # and updating it in place.
  #
  # @example
  #   h = { "a" => "b", "c" => "d" }
  #   h.each_pair! {|key,value| key.upcase, value.upcase }
  #   h => { "A" => "B", "C" => "D" }
  #
  # @return self
  #
  def each_pair!
    replacements=[]
    keys.each{|key|
      value=self[key]
      key2,value2=yield(key,value)
      if key===key2
        if value!=value2
          self[key]=value2
        end
      else
        replacements << [key,key2,value2]
      end
    }
    replacements.each{|key,key2,value2|
      self.delete(key)
      self[key2]=value2
    }
    return self
  end

  # Call block once for each key-pair value in self,
  # passing the key as a parameter to the block,
  # and mapping it to a result.
  #
  # @example
  #   h = {"a" => "b"}
  #   h.map_key{|key| key.upcase }
  #   => {"A" => "b"}
  #
  # @return [self.class] a new object with the mapped keys and existing values.
  #
  def map_key
    result = self.class.new
    keys.each{|key| result[yield key] = self[key]}
    result
  end

  # Call block once for each key-value pair in self,
  # passing the value as a parameter to the block,
  # and mapping it to a result.
  #
  # @example
  #   h = {"a" => "b"}
  #   h.map_value{|value| value.upcase }
  #   => {"a" => "B"}
  #
  # @return [self.class] a new object with the existing keys and mapped values.
  #
  def map_value
    result = self.class.new
    keys.each{|key| result[key] = yield self[key]}
    result
  end

  # Call block once for each key-value pair in self,
  # passing the key and value as parameters to the block.
  # and mapping these to a result.
  #
  # @example
  #   h = {"a" => "b"}
  #   h.map_pair{|key, value| key.upcase, value.upcase }
  #   => {"A" => "B"}
  #
  # @return [self.class] a new object with the mapped keys and mapped values.
  #
  def map_pair
    result = self.class.new
    keys.each{|key| k, v = yield key, self[key]; result[k] = v}
    result
  end

  # Calls block once for each key-value pair in self,
  # passing the key and value as paramters to the block.
  #
  # @example
  #   h = {"a"=>"b", "c"=>"d", "e"=>"f" }
  #   h.map_pair{|key,value| key+value }
  #   => ["ab","cd","ef"]
  #
  def yield_pair
    keys.map{|key| yield key, self[key] }
  end

end
