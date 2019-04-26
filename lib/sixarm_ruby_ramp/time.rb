# -*- coding: utf-8 -*-

# Time extensions

class Time

  # @return [String] time packed into a short string: "YYYYMMDDHHMMSS"
  #
  # The time is converted to UTC.
  #
  # @example
  #   Time.now.pack
  #   => "20101231125959" 

  def pack
    getutc.strftime('%Y%m%d%H%M%S')
  end


  # Shorthand for Time.now.pack
  #
  # @example
  #   Time.pack
  #   => "20101231125959" 
  # 
  # @return [String] Time.now.pack                                                                                 

  def self.pack
    now.pack
  end

end
