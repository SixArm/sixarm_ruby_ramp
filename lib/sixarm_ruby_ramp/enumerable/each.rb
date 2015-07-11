# -*- coding: utf-8 -*-
module Enumerable

  # Get each element at a given index or indices.
  #
  # Example: use an index.
  #
  #   ["a", "b", "c", "d", "e"].each_at(1)
  #   #=> "b"
  #
  # Example: use an index that is negative when size is known.
  #
  #   ["a", "b", "c", "d", "e"].each_at(-1)
  #   => "e"
  #
  # Example: use a range.
  #
  #   ["a", "b", "c", "d", "e"].each_at(1..3)
  #   => "b", "c", "d"
  #
  # Example: use a range that has negatives when size is known.
  #
  #   ["a", "b", "c", "d", "e"].each_at(-3..-1)
  #   => "c", "d", "e"
  #
  # Example: use any object that responds to #each or #include?.
  #
  #   ["a", "b", "c", "d", "e"].each_at([4, 2, -2])
  #   => "e", "c", "d"
  #
  def each_at(filter)
    filter, optimize_for_whole_numbers = each_at_normalize_filter(filter)

    # Handle variations.
    #
    # Can we call self#at?
    #
    #  * Yes: look up a self element by index.
    #  * No: iterate on self, comparing the loop count to filter target.
    #
    # Can we call filter#each?
    #
    #  * Yes: iterate on the filter elements.
    #  * No:  iterate on self, comparing the loop count to filter#include?
    #
    # Can we optimize for whole numbers?
    #
    #  * Yes: we know that all filter targets are whole numbers.
    #  * No: we must convert the filter target to an index size each time.
    #
    if self.respond_to?(:at) && filter.respond_to?(:each)
      if optimize_for_whole_numbers
        each_at_impl_with_self_at_and_filter_each_and_whole_numbers(filter)
      else
        each_at_impl_with_self_at_and_filter_each(filter)
      end
    elsif filter.respond_to?(:include?)
      each_at_impl_with_worst_case(filter)
    else
      raise ArgumentError
    end
  end

  protected

  # Normalize the filter to make it respond to #each and #include?.
  # If we can guarantee the filter is all whole numbers, then optimize.
  #
  def each_at_normalize_filter(filter)
    case filter
    when Numeric
      return [filter.to_i], filter >= 0
    when Range
      if filter.first < 0 || filter.last < 0
        min = filter.first.to_i; min += size if min < 0
        max = filter.last.to_i; max += size if max < 0
        max -= 1 if filter.exclude_end?
        filter = min..max
      end
      return filter, true
    else
      return filter, false
    end
  end

  # The #each_at method calls this method when we can use the
  # best fast implementation, i.e. using self#at, filter#each,
  # and knowing that all the filter elements are >= 0.
  #
  def each_at_impl_with_self_at_and_filter_each_and_whole_numbers(filter)
    filter.each{|i|
      yield(at(i))
    }
  end

  # The #each_at method calls this method when we can use the
  # second-best implementation, i.e. using self#at, filter#each,
  # yet having to test each filter elements for negative indexing.
  #
  def each_at_impl_with_self_at_and_filter_each(filter)
    filter.each{|i|
      yield(at(i >= 0 ? i : i + self.size))
    }
  end

  # The #each_at method calls this method when we cannot use self#at
  # and filter#each, thus we must use a loop counter and iteration
  # on the self elements, and test whether the counter is in the filter.
  #
  # This is the worst case solution, and is rarely needed in the wild.
  #
  def each_at_impl_with_worst_case(filter)
    i = 0
    s = respond_to?(:size) ? size : nil
    each{|e|
      yield(e) if (filter.include?(i) || (size ? filter.include(i - size)))
      i += 1
    }
  end

end
