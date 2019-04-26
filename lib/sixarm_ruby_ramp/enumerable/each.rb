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
        # each_at_strategy_with_self_at_and_filter_each_and_whole_numbers(filter)
        filter.each{|i|
          yield(at(i))
        }
      else
        # each_at_strategy_with_self_at_and_filter_each(filter)
        filter.each{|i|
          yield(at(i >= 0 ? i : i + self.size))
        }
      end
    elsif filter.respond_to?(:include?)
      # each_at_strategy_with_count(filter)
      i = 0
      _size = respond_to?(:size) ? size : nil
      each{|e|
        yield(e) if (filter.include?(i) || (_size && filter.include(i - _size)))
        i += 1
      }
    else
      raise ArgumentError
    end
  end

  # Implement #each_at by using a strategy with no optimization.
  #
  # When #each_at tests that either self#at is unavailable or filter#each
  # is unavailable, then #each_at calls this strategy.
  #
  # This strategy uses a loop counter and iteration on the self elements,
  # and each iteration, test whether the counter is in the filter.
  #
  # This strategy is the slowest, and for the worst-case need.
  # This strategy is rarely needed in the wild.
  #
  def each_at_strategy_with_optimization_off(filter)
    i = 0
    if respond_to?(:size)
      each{|e|
        yield(e) if (filter.include?(i) || (size && filter.include?(i - size)))
        i += 1
      }
    else
      each{|e|
        yield(e) if (filter.include?(i))
        i += 1
      }
    end
  end

  # Implement #each_at by using a strategy with some optimization.
  #
  # When #each_at tests that both self#at is available and filter#each
  # is available, yet cannot test that all indexes are whole numbers,
  # then #each_at calls this strategy.
  #
  def each_at_strategy_with_optimization_min(filter)
    filter.each{|i|
      yield(at(i >= 0 ? i : i + self.size))
    }
  end

  # Implement #each_at by using a strategy with full optimization.
  #
  # When #each_at tests that both self#at is available and filter#each
  # is available, and can test that all indexes are whole numbers,
  # then #each_at calls this strategy.
  #
  def each_at_strategy_with_optimization_max(filter)
    filter.each{|i|
      yield(at(i))
    }
  end

  # Normalize the filter to make it respond to #each and #include?.
  #
  # If we can guarantee the filter is all whole numbers,
  # then subsequent method calls can optimize the index lookup,
  # by looking for the whole numbers instead of negative numbers.
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

end
