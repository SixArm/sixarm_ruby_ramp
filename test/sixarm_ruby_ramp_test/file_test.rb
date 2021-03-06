# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"

class FileTestClass < Minitest::Test

  def test_load_dir_files
    filename='/a/b/c.d'
    dirname=File.dirname(filename)
    expect=File.join(dirname,'x','y','z')
    actual=File.joindir(filename,'x','y','z')
    assert_equal(expect,actual,"filename:#{filename} dirname:#{dirname}")
  end

end
