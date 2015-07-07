class Array

  # Alias join because we're going to override it
  alias :ruby_join :join

  # Concatenate the items into a string by join.
  #
  # @return [String] concatenated string
  #
  # @example Join with infix
  #   list=['a','b','c']
  #   list.join("*") => "a*b*c"
  #
  # @example Join with prefix and suffix
  #   list=['a','b','c']
  #   list.join("[","]") => "[a][b][c]"
  #
  # @example Join with prefix, suffix, and infix
  #   list=['a','b','c']
  #   list.join("*","[","]") => "[a]*[b]*[c]"
  #
  def join(*fixes)
    if fixes.is_a?(String) then return self.ruby_join(fixes) end
    return case fixes.size
    when 0
      ruby_join
    when 1
      ruby_join(fixes[0].to_s)
    when 2
      join_prefix_suffix(*fixes)
    when 3
      join_prefix_suffix_infix(*fixes)
    else
      raise ArgumentError, "join() takes 0-3 arguments; you gave #{fixes.size}]"
    end
  end

  # Concatenate the items by joining using a prefix string and suffix string.
  #
  # @return [String] concatenated string
  #
  # @example
  #   list=['a','b','c']
  #   list.join("[","]") => "[a][b][c]"
  #
  def join_prefix_suffix(prefix, suffix)
    prefix = prefix.to_s
    suffix = suffix.to_s
    return self.map{|item| prefix + item.to_s + suffix}.ruby_join()
  end

  # Concatenate the items by joining using a prefix string, suffix string, and infix string.
  #
  # @return [String] concatenated string
  #
  # @example
  #   list=['a','b','c']
  #   list.join("*","[","]") => "[a]*[b]*[c]"
  #
  def join_prefix_suffix_infix(prefix, suffix, infix)
    prefix = prefix.to_s
    suffix = suffix.to_s
    infix = infix.to_s
    return self.map{|item| prefix + item.to_s + suffix}.ruby_join(infix)
  end

end
