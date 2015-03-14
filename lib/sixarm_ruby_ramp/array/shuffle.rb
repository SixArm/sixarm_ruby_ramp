# -*- coding: utf-8 -*-

class Array

  unless method_defined? :shuffle

    # Randomly arrange the array items.
    #
    # @return [Array] a new array with the items shuffled.
    #
    # This implementation is optimized for speed, not for memory use.
    # See http://codeidol.com/other/rubyckbk/Arrays/Shuffling-an-Array/
    #
    # @example
    #   list=
    #   list=['a','b','c']
    #   list.shuffle!
    #   list => ['c','a','b']

    def shuffle
      dup.shuffle!
    end

  end

  unless method_defined? :shuffle!

    # Randomly arrange the array items.
    #
    # @return [Array] the array, with its items shuffled.
    #
    # This implementation is optimized for speed, not for memory use.
    # See http://codeidol.com/other/rubyckbk/Arrays/Shuffling-an-Array/
    #
    # @example
    #   list=
    #   list=['a','b','c']
    #   list.shuffle!
    #   list => ['c','a','b']

    def shuffle!
      each_index do |i|
        j = rand(length-i) + i
        self[j], self[i] = self[i], self[j]
      end
    end
  end

end
