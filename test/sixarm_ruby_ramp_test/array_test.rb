# -*- coding: utf-8 -*-
require "sixarm_ruby_ramp_test"
require "csv"

class ArrayTest < Minitest::Test

  A=["a", "b", "c", "d"]
  B=["w", "x", "y", "z"]
  GRID = [["a", "b", "c"], ["d", "e", "f"], ["g", "h", "i"]]


  def test_size_with_one_item
    assert_equal(true,[1].size?)
  end

  def test_size_with_two_items
    assert_equal(true,[1,2].size?)
  end

  def test_size_with_empty
    assert_equal(false,[].size?)
  end

  def test_size_with_nil
    assert_equal(true,[nil].size?)
  end

  def test_size_with_one_empty
    assert_equal(true,[[]].size?)
  end

 def test_rotate
   a=A.dup
   a.rotate!
   assert_equal(["b", "c", "d", "a"],a)
   a.rotate!
   assert_equal(["c", "d", "a", "b"],a)
   a.rotate!
   assert_equal(["d", "a", "b", "c"],a)
   a.rotate!
   assert_equal(["a", "b", "c", "d"],a)
 end

 def test_rotate_with_empty
   a=[]
   a.rotate!
   assert_equal([],a)
 end

 def test_choice
   5.times {
     c=A.choice
     assert_equal(String,c.class)
     assert(A.include?(c))
   }
 end

 def test_choices
   5.times {
     c=A.choices(2)
     assert_equal(2,c.size)
     assert(A.include?(c[0]))
     assert(A.include?(c[1]))
     c=A.choices(3)
     assert_equal(3,c.size)
     assert(A.include?(c[0]))
     assert(A.include?(c[1]))
     assert(A.include?(c[2]))
   }
 end

 def test_onto
   assert_equal({"a"=>"w", "b"=>"x", "c"=>"y", "d"=>"z"},A.onto(B))
 end

 def test_onto_with_empty
   assert_raises(ArgumentError){ A.onto([]) }
 end

 def test_union
   a=[[1,2,3,4],[2,3,4,5],[3,4,5,6]]
   assert_equal([1,2,3,4,5,6],a.union)
 end

 def test_union_with_empty
   assert_equal([],[].union)
 end

 def test_intersect
   a=[[1,2,3,4],[2,3,4,5],[3,4,5,6]]
   assert_equal([3,4],a.intersect)
 end

 def test_intersect_with_empty
   assert_equal([],[].intersect)
 end

  def test_shifted
    a=["a", "b", "c"]
    assert_equal([    "b", "c"],a.shifted)
    assert_equal(["a", "b", "c"],a.shifted(0))
    assert_equal([    "b", "c"],a.shifted(1))
    assert_equal([        "c"],a.shifted(2))
    assert_equal([           ],a.shifted(3))
    assert_nil(                a.shifted(4))
  end

  def test_shifted_with_negative_count
    assert_raises(ArgumentError){ [].shifted(-1) }
  end

  def test_shifted_with_non_integer_count
    assert_raises(ArgumentError){ [].shifted(0.123) }
  end

  def test_shifted_with_non_numeric_count
    assert_raises(ArgumentError){ [].shifted("") }
  end

  # alias: test_cdr must be idential to test_shifted
  def test_cdr
    a=["a", "b", "c"]
    assert_equal([    "b", "c"],a.cdr)
    assert_equal(["a", "b", "c"],a.cdr(0))
    assert_equal([    "b", "c"],a.cdr(1))
    assert_equal([        "c"],a.cdr(2))
    assert_equal([           ],a.cdr(3))
    assert_nil(                a.cdr(4))
  end

  # alias: test_cdr must be idential to test_shifted
  def test_cdr_with_negative_count
    assert_raises(ArgumentError){ [].cdr(-1) }
  end

  # alias: test_cdr must be idential to test_shifted
  def test_cdr_with_non_integer_count
    assert_raises(ArgumentError){ [].cdr(0.123) }
  end

  # alias: test_cdr must be idential to test_shifted
  def test_cdr_with_non_numeric_count
    assert_raises(ArgumentError){ [].cdr("") }
  end

  # alias: test_rest must be idential to test_shifted
  def test_rest
    a=["a", "b", "c"]
    assert_equal([    "b", "c"],a.rest)
    assert_equal(["a", "b", "c"],a.rest(0))
    assert_equal([    "b", "c"],a.rest(1))
    assert_equal([        "c"],a.rest(2))
    assert_equal([           ],a.rest(3))
    assert_nil(                a.rest(4))
  end

  # alias: test_rest must be idential to test_shifted
  def test_rest_with_negative_count
    assert_raises(ArgumentError){ [].rest(-1) }
  end

  # alias: test_rest must be idential to test_shifted
  def test_rest_with_non_integer_count
    assert_raises(ArgumentError){ [].rest(0.123) }
  end

  # alias: test_rest must be idential to test_shifted
  def test_rest_with_non_numeric_count
    assert_raises(ArgumentError){ [].rest("") }
  end

  def test_shifted_bang
    a=["a", "b", "c"]; a.shifted!;    assert_equal([    "b", "c"],a)
    a=["a", "b", "c"]; a.shifted!(0); assert_equal(["a", "b", "c"],a)
    a=["a", "b", "c"]; a.shifted!(1); assert_equal([    "b", "c"],a)
    a=["a", "b", "c"]; a.shifted!(2); assert_equal([        "c"],a)
    a=["a", "b", "c"]; a.shifted!(3); assert_equal([           ],a)
    a=["a", "b", "c"]; a.shifted!(4); assert_equal([           ],a)
  end

  def test_shifted_bang_with_negative_count
    assert_raises(ArgumentError){ [].shifted!(-1) }
  end

  def test_shifted_bang_with_non_integer_count
    assert_raises(ArgumentError){ [].shifted!(0.123) }
  end

  def test_shifted_bang_with_non_numeric_count
    assert_raises(ArgumentError){ [].shifted!("") }
  end

  # alias: test_cdr_bang must be identical to test_shifted_bang
  def test_cdr_bang
    a=["a", "b", "c"]; a.cdr!;    assert_equal([    "b", "c"],a)
    a=["a", "b", "c"]; a.cdr!(0); assert_equal(["a", "b", "c"],a)
    a=["a", "b", "c"]; a.cdr!(1); assert_equal([    "b", "c"],a)
    a=["a", "b", "c"]; a.cdr!(2); assert_equal([        "c"],a)
    a=["a", "b", "c"]; a.cdr!(3); assert_equal([           ],a)
    a=["a", "b", "c"]; a.cdr!(4); assert_equal([           ],a)
  end

  # alias: test_cdr_bang must be identical to test_shifted_bang
  def test_cdr_bang_with_negative_count
    assert_raises(ArgumentError){ [].cdr!(-1) }
  end

  # alias: test_cdr_bang must be identical to test_shifted_bang
  def test_cdr_bang_with_non_integer_count
    assert_raises(ArgumentError){ [].cdr!(0.123) }
  end

  # alias: test_cdr_bang must be identical to test_shifted_bang
  def test_cdr_bang_with_non_numeric_count
    assert_raises(ArgumentError){ [].cdr!("") }
  end

  # alias: test_rest_bang must be identical to test_shifted_bang
  def test_rest_bang
    a=["a", "b", "c"]; a.rest!;    assert_equal([    "b", "c"],a)
    a=["a", "b", "c"]; a.rest!(0); assert_equal(["a", "b", "c"],a)
    a=["a", "b", "c"]; a.rest!(1); assert_equal([    "b", "c"],a)
    a=["a", "b", "c"]; a.rest!(2); assert_equal([        "c"],a)
    a=["a", "b", "c"]; a.rest!(3); assert_equal([           ],a)
    a=["a", "b", "c"]; a.rest!(4); assert_equal([           ],a)
  end

  # alias: test_rest_bang must be identical to test_shifted_bang
  def test_rest_bang_with_negative_count
    assert_raises(ArgumentError){ [].rest!(-1) }
  end

  # alias: test_rest_bang must be identical to test_shifted_bang
  def test_rest_bang_with_non_integer_count
    assert_raises(ArgumentError){ [].rest!(0.123) }
  end

  # alias: test_rest_bang must be identical to test_shifted_bang
  def test_rest_bang_with_non_numeric_count
    assert_raises(ArgumentError){ [].rest!("") }
  end

  def test_car
    a=["a", "b", "c"]
    assert_equal("a",a.car)
  end

  def test_to_csv_lines
    assert_equal(["a,b,c\n", "d,e,f\n", "g,h,i\n"], GRID.to_csv_lines)
  end

  def test_to_csv_text
    assert_equal("a,b,c\nd,e,f\ng,h,i\n", GRID.to_csv_text)
  end

  def test_to_tsv_lines
    assert_equal(["a\tb\tc\n", "d\te\tf\n", "g\th\ti\n"], GRID.to_tsv_lines)
  end

  def test_to_tsv_text
    assert_equal("a\tb\tc\nd\te\tf\ng\th\ti\n", GRID.to_tsv_text)
  end

end
