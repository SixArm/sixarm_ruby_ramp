require 'test/unit'
require 'sixarm_ruby_ramp'

class KernelTest < Test::Unit::TestCase

  def test_my_method_name
    assert_equal('test_my_method_name', my_method_name)
  end

  def test_caller_method_name
    assert_equal('test_caller_method_name', caller_method_name)
  end

  def test_caller_method_name_with_index_0
    assert_equal('test_caller_method_name_with_index_0', caller_method_name(0))
  end

  def test_caller_method_name_with_index_1
    method_name = RUBY_VERSION >= "1.9.0" ? "run" : "__send__"
    assert_equal(method_name, caller_method_name(1))
  end

  def test_pp_s
    assert_equal(":foo\n",pp_s(:foo))
  end

end

