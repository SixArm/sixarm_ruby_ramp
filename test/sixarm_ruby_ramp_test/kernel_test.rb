# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'sixarm_ruby_ramp'

class KernelTest < Minitest::Test

  class TestMyMethodName
    def a
      my_method_name  
    end
  end

  class TestCallerMethodNameWithNoOps
    def a
      caller_method_name()
    end
  end

  class TestCallerMethodNameWithIndex0
    def a
      caller_method_name(0)  
    end
  end

  class TestCallerMethodNameWithIndex1
    def a
      b
    end
    def b
      caller_method_name(1) 
    end
  end

  def test_my_method_name
    assert_equal('a', TestMyMethodName.new.a)
  end

  def test_caller_method_name_with_no_ops
    assert_equal('a', TestCallerMethodNameWithNoOps.new.a)
  end

  def test_caller_method_name_with_index_0
    assert_equal('a', TestCallerMethodNameWithIndex0.new.a)
  end

  def test_caller_method_name_with_index_1
    assert_equal('a', TestCallerMethodNameWithIndex1.new.a)
  end

  def test_pp_s
    assert_equal(":foo\n",pp_s(:foo))
  end

end

