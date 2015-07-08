# -*- coding: utf-8 -*-
module Enumerable

  # Get each_element at a given index or indices.
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
    # Normalize the filter to make it respond to #each and #include?.
    case filter
    when Numeric
      filter = [i]
    when Range
      if filter.first < 0 || filter.last < 0
        min = filter.first.to_i; min += size if min < 0
        max = filter.last.to_i; max += size if max < 0
        max -= 1 if filter.exclude_end?
        filter = min..max
      end
      optimize_for_whole_numbers = true
    end
    if respond_to?(:at) && filter.respond_to?(:each)
      if optimize_for_whole_numbers
        filter.each{|i|
          yield(at(i))
        }
      else
        filter.each{|i|
          i += size if i < 0
          yield(at(i))
        }
      end
    elsif filter.respond_to?(:include?)
      i = 0
      each{|e|
        yield(e) if filter.include?(i)
        i += 1
      }
    else
      raise ArgumentError
    end

  end
end
