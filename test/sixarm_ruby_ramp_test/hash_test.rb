# -*- coding: utf-8 -*-
require "minitest/autorun"
require "sixarm_ruby_ramp"

class HashTest < Minitest::Test

  def test_size_true
    h = {'a'=>'b'}
    assert(h.size?)
  end

  def test_size_false
    h = {}
    assert(!h.size?)
  end

  def test_sort_by_keys
    h = {'c' => 'z', 'b' => 'y', 'a' => 'x'}
    assert_equal({'a' => 'x', 'b' => 'y', 'c' => 'z'}, h.sort_by_keys)
  end

  def test_merge_recurse
    # Test with three kinds of items:
    #   * same key => same value #=> must stay the same
    #   * same key => other value #=> must use the other value
    #   * different key => any value #=> output must contain the key and value
    h1={ "a" => "b", "c" => "d", "e" => "f", "g" => { "h" => "i", "j" => "k", "l" => "m"}}
    h2={ "a" => "b", "c" => "D", "E" => "F", "g" => { "h" => "i", "j" => "K", "L" => "M"}}
    expect={ "a" => "b", "c" => "D", "e" => "f", "g" => { "h" => "i", "j" => "K", "l" => "m", "L" => "M"}, "E" => "F"}
    actual=h1.merge_recurse(h2)
    assert_equal(expect,actual,h1.inspect+h2.inspect)
  end

  def pivotable
    h=Hash.new
    h['a']=Hash.new
    h['b']=Hash.new
    h['c']=Hash.new
    h['a']['x']='m'
    h['a']['y']='n'
    h['a']['z']='o'
    h['b']['x']='p'
    h['b']['y']='q'
    h['b']['z']='r'
    h['c']['x']='s'
    h['c']['y']='t'
    h['c']['z']='u'
    return h
  end

  def test_pivot_vals
    p=pivotable.pivot(:vals)
    assert_equal(['x','y','z'], p.keys.sort)
    assert_equal(['m','p','s'], p['x'].sort)
    assert_equal(['n','q','t'], p['y'].sort)
    assert_equal(['o','r','u'], p['z'].sort)
  end

  def test_pivot_vals_with_block
    p=pivotable.pivot(:vals){|items| items.sort.join }
    assert_equal(['x','y','z'], p.keys.sort)
    assert_equal('mps', p['x'])
    assert_equal('nqt', p['y'])
    assert_equal('oru', p['z'])
  end

  def test_pivot_keys
    p=pivotable.pivot(:keys)
    assert_equal(['a','b','c'], p.keys.sort)
    assert_equal(['m','n','o'], p['a'].sort)
    assert_equal(['p','q','r'], p['b'].sort)
    assert_equal(['s','t','u'], p['c'].sort)
  end

  def test_pivot_keys_with_block
    p=pivotable.pivot(:keys){|items| items.sort.join }
    assert_equal(['a','b','c'], p.keys.sort)
    assert_equal('mno', p['a'])
    assert_equal('pqr', p['b'])
    assert_equal('stu', p['c'])
  end

  def test_pivot_direction_up_with_true
    Hash.publicize_methods do
      assert({}.pivot_direction_up?('key'))
      assert({}.pivot_direction_up?('keys'))
      assert({}.pivot_direction_up?('up'))
      assert({}.pivot_direction_up?('left'))
      assert({}.pivot_direction_up?('out'))
    end
  end

  def test_pivot_direction_up_with_false
    Hash.publicize_methods do
      assert(!{}.pivot_direction_up?('val'))
      assert(!{}.pivot_direction_up?('vals'))
      assert(!{}.pivot_direction_up?('down'))
      assert(!{}.pivot_direction_up?('right'))
      assert(!{}.pivot_direction_up?('in'))
    end
  end

  def test_pivot_direction_up_with_invalid
    Hash.publicize_methods do
      assert_raises(ArgumentError){ {}.pivot_direction_up?('nonsense') }
    end
  end

end
