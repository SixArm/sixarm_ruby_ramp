# -*- coding: utf-8 -*-

require 'yaml'
require_relative 'pairable'

# Hash extensions

class Hash
  include Pairable

  # Does the hash contain any items?
  #
  # @return [Boolean] true if size > 0
  #
  def size?
    size>0
  end

  # Sort the hsh items by the keys.
  #
  # @return [Hash] a new hash sorted by the keys
  #
  # @example
  #    h = {"c" => "cherry", "b" => "banana", "a" =>"apple" }
  #    h.sort_keys => {"a" => "apple", "b" => "banana", "c" => "cherry"}
  #
  def sort_by_keys
    Hash[sort]
  end

  # Return a new hash containing the contents of other_hash and the
  # contents of hsh.
  #
  # If no block is specified, the value for entries with duplicate
  # keys will be that of other_hash; if the values are both hashes,
  # then this method recurses.
  #
  # Otherwise the  value for each duplicate key is determined by calling
  # the block with the key, its value in hsh and its value in other_hash.
  #
  # @example:
  #
  #   h1 = {a: 'b', c: {d: 'e'}}
  #   h2 = {a: 'B', c: {d: 'E'}}
  #   h1.merge_recurse(h2)
  #   #=> {a: 'B', c: {d: 'E'}}
  #
  def merge_recurse(other_hash)
    merge(other_hash){|key, oldval, newval|
      if oldval.is_a?(Hash) && newval.is_a?(Hash)
        oldval.merge_recurse(newval)
      else
        newval
      end
    }
  end

  # Hash#pivot aggregates values for a hash of hashes,
  # for example to calculate subtotals and groups.
  #
  # Suppose you have data arranged by companies, roles, and headcounts.
  #
  #     data = {
  #     "Apple"     => {"Accountants" => 11, "Designers" => 22, "Developers" => 33},
  #     "Goggle"    => {"Accountants" => 44, "Designers" => 55, "Developers" => 66},
  #     "Microsoft" => {"Accountants" => 77, "Designers" => 88, "Developers" => 99},
  #   }
  #
  # To calculate each company's total headcount, you pivot up, then sum:
  #
  #   data.pivot(:up,&:sum)
  #   => {
  #    "Apple"=>66,
  #    "Goggle"=>165,
  #    "Microsoft"=>264
  #   }
  #
  # To calculate each role's total headcount, you pivot down, then sum:
  #
  #   data.pivot(:down,&:sum)
  #   => {
  #    "Accountants"=>132,
  #    "Designers"=>165,
  #    "Developers"=>198
  #   }
  #
  #  Generic example:
  #   h={
  #    "a"=>{"x"=>1,"y"=>2,"z"=>3},
  #    "b"=>{"x"=>4,"y"=>5,"z"=>6},
  #    "c"=>{"x"=>7,"y"=>8,"z"=>9},
  #   }
  #   h.pivot(:keys) => {"a"=>[1,2,3],"b"=>[4,5,6],"c"=>[7,8,9]}
  #   h.pivot(:vals) => {"x"=>[1,4,7],"y"=>[2,5,8],"z"=>[3,6,9]}
  #
  # = Calculating subtotals
  #
  # The pivot method is especially useful for calculating subtotals.
  #
  # @example
  #   r = h.pivot(:keys)
  #   r['a'].sum => 6
  #   r['b'].sum => 15
  #   r['c'].sum => 24
  #
  # @example
  #   r=h.pivot(:vals)
  #   r['x'].sum => 12
  #   r['y'].sum => 15
  #   r['z'].sum => 18
  #
  # = Block customization
  #
  # You can provide a block that will be called for the pivot items.
  #
  # @example
  #   h.pivot(:keys){|items| items.max } => {"a"=>3,"b"=>6,"c"=>9}
  #   h.pivot(:keys){|items| items.join("/") } => {"a"=>"1/2/3","b"=>"4/5/6","c"=>"7/8/9"}
  #   h.pivot(:keys){|items| items.inject{|sum,x| sum+=x } } => {"a"=>6,"b"=>15,"c"=>24}
  #
  # @example
  #   h.pivot(:vals){|items| items.max } => {"a"=>7,"b"=>8,"c"=>9}
  #   h.pivot(:vals){|items| items.join("-") } => {"a"=>"1-4-7","b"=>"2-5-8","c"=>"3-6-9"}
  #   h.pivot(:vals){|items| items.inject{|sum,x| sum+=x } } => {"a"=>12,"b"=>15,"c"=>18}

  def pivot(direction='keys',&block)
    a=self.class.new
    direction=direction.to_s
    up=pivot_direction_up?(direction)
    each_pair{|k1,v1|
      v1.each_pair{|k2,v2|
        k = up ? k1 : k2
        a[k]=[] if (a[k]==nil or a[k]=={})
        a[k]<<(v2)
      }
    }
    if block
      a.each_pair{|key,val| a[key]=block.call(val)}
    end
    a
  end

  protected

  def pivot_direction_up?(direction_name)
    case direction_name.to_s
    when 'key','keys','up','left','out' then return true
    when 'val','vals','down','right','in' then return false
    else raise ArgumentError.new('Pivot direction must be either: key/keys/up/left/out or val/vals/down/right/in')
    end
  end

end
