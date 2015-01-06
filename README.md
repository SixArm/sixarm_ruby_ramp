# SixArm.com » Ruby » <br> Ramp gem is a toolkit of Ruby base class extensions

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_ramp.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_ramp)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_ramp.png)](https://travis-ci.org/SixArm/sixarm_ruby_ramp)

* Doc: <http://sixarm.com/sixarm_ruby_ramp/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_ramp>
* Repo: <http://github.com/sixarm/sixarm_ruby_ramp>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Ramp is a library of extensions to Ruby base classes.

We extend Array, Date, Enumerable, Hash, Kernel, Numeric, Object, Process, String, Time, and YAML.

For docs go to <http://sixarm.com/sixarm_ruby_ramp/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_ramp

Bundler:

    gem "sixarm_ruby_ramp", "~>4.0.0"

Require:

    require "sixarm_ruby_ramp"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_ramp --trust-policy HighSecurity


## Array

* car, cdr: aka first, rest (see shifted)
* choice, choices: one or more random elements from an array
* cross: return the cross pairings of an array with another array
* divvy: divides an array, like a pie, into a specified number of slices (deprecated - see method rdoc)
* join, join_prefix_suffix, join_prefix_suffix_infix: like Array#join with improvements
* onto: return a hash that maps an array's keys on to another array's values
* rotate: moves the first element of an array to the end
* rest: return the rest of the items of the array (aka cdr, aka shifted)
* shifted, shifted!: return an array with the first n items shifted (aka cdr, aka rest)
* shuffle, shuffle!: randomly sort an array efficiently; each of these methods are loaded only if needed (Ruby 1.8.7+ already defines shuffle)
* slices: divide an array into specified number of equal size sub-arrays (deprecated - see method rdoc)
* to_csv: join a multidimensional array into a string in CSV (Comma Separated Values), with each subarray becoming one 'line' in the output; typically for viewing in a spreadsheet such as Excel.
* to_tdf: join a multidimensional array into a string in TDF (Tab Delimited Format); this is an alias for #to_tsv
* to_tsv: join a multidimensional array into a string in TSV (Tab Separated Values), with each subarray becoming one 'line' in the output; typically for viewing in a spreadsheet such as Excel.
* union: builds an array containing each of the unique elements of sub-arrays ([[1,2,3,4],[2,3,4,5],[3,4,5,6]].union => [1,2,3,4,5,6])


## Class

* publicize_methods: make all methods public for a block, e.g. to unit test private methods


## CSV

* http_headers: provides web file download headers for text/csv content type and disposition.


## Date

* age_days, age_years
* between: a random date between two specified dates
* to_sql: date as a string formatted as expected for MySQL
* weekday?, weekend?: is date a weekday or on the weekend


## Enumerable

* cartesian_product: return an array of all possible ordered tuples from arrays.
* hash_by: convert the array to a hash by mapping each item to a key=>value pair.
* index_by: convert the array to a hash by mapping each ite to a key=>item pair.
* join: forwards to self.to_a.join
* map_id: return the id of an Enumerable object; *requires* that the object respond to an 'id' message
* map_to_a, map_to_f, map_to_i, map_to_s, map_to_sym: convert each object to a specific type by calling its respective method to_a, to_i, to_f, to_s, to_sym
* map_with_index: for each item, yield to a block with the item and its incrementing index
* nitems_until, select_until: return the number of, or an array containing, the leading elements for which block is false or nil.
* nitems_while, select_while: return the number of items, or an array containing the leading elements, for which block is not false or nil.
* nitems_with_index, select_with_index: calls block with two arguments, the item and its index, for each item in enum. Return the number of, or an array containing, the leading elements for which block is not false or nil.
* power_set: return an array with all subsets of the enum's elements


## File

* File.joindir: wrapper for File.join(File.dirname(...),string,...)


## Fixnum

* even?: is the number even?
* odd?: is the number odd?


## Hash

* size?: return true if hash has any keys
* sort_by_keys: return a new Hash sorted by keys
* each_sort: sort the keys then call each
* each_key!: passes each key to a specified block and updates hash in place if the key changes
* each_pair!: passes each key value pair to a specified block and updates the hash in place if the key or value change.
* each_value!: passes each value to a specified block and updates the hash in place if the value changes.
* map_key: map each key-value pair's key by calling a a block
* map_pair: map each key-value pair by calling a a block
* map_value: map each key-value pair by calling a a block
* merge_recurse: merge two hashes plus recurse whenever a key is a hash.
* pivot: aggregates subtotals by keys and values, such as a rollup and rolldown
* yield_pair: yield each key-value pair by calling a a block


## Integer

* maps: syntactic sugar to yield n times to a block, returning an array of any results
* odd?: is the number odd?


## IO

* readrow: reads a row line as with IO#readline, and return the row split it into fields
* IO.readrows: reads the entire file specified by name as individual row lines, and return those rows split into fields, in an array of arrays.


## Kernel

* my_method_name: return the name of the current method
* caller_method_name: return the name of the caller method, or the Nth parent up the call stack if the optional caller_index parameter is passed.


## Math

* ln(x): natural log of x
* logn(x,b): log of x in base b


## NilClass

* blank?: return true (same as Rails)


## Numeric

* if: return 0 if the passed flag is any of: nil, false, 0, [], {} and otherwise return self
* unless: return 0 unless the passed flag is any of: nil, false, 0, [], {} and otherwise return self
* percent: return the number as a percentage with optional rounding to decimal points
* floor_precision: return the number truncated to a given precision, i.e. decimal points


## Object

* in?: return boolean indicating whether the object is a member of the specified array parameter


## Process

Extensions that help debug Ruby programs.

* (class) ps: output of the system 'ps' command, also including aliases, as raw plain text.
* (class) pss: output of the system 'ps' command as a hash with each value set to the right type, e.g., integer, float, etc..


## REXML::Attributes

* hash: flattens the attributes hash set into a more useful ruby hash, e.g. {:height => 100, :width => 400 }


## REXML::Document

* remove_attributes: remove all the attributes from the document's elements


## REXML::Element

* remove_attributes: remove all the attributes from the element


## String

* capitalize_words (alias to titleize/titlecase): ensures the first character of each word is uppercase.
* decrement: decrease the rightmost natural number, defaults to one value lower or by the optional step parameter value.
* increment: increase the rightmost natural number, defaults to one value higher or by the optional step parameter value.
* lorem: return a short random string, good for use in "lorem ipsum" sample text.
* lowcase: translate a string to lowercase, digits and single underscores (e.g. to a method name)
* prev/pred: previous string ("b" => "a", "bbc" => "bbb", "a" => "z", "880" => "879")
* prev!/pred!: updates variable to the previous string in place (astring = "bbc", astring.prev!, puts astring => "bbb")
* (class) prev_char/pred_char: return the previous character, with a changed flag and carry flag; that is, there are three returned values, a string and two booleans.
* split_tab: split the string into an array at each embedded tab ("Last\tFirst\tMiddle" => ["last","first","middle"])
* split_tsv: split the string into an array at each embedded newline and embedded tab ("A\tB\t\C\nD\tE\tF" => [["A","B","C"],["D","E","F"]])
* to_class: the global class reference of a given string
* words: split the string into an array of words


## Symbol

* <=> and include the comparable mixin to compare symbols as strings


## Time

* (class) stamp: current time in UTC as a timestamp string ("YYYYMMDDHHMMSS")
* to_sql: time as a string formatted as expected for MySQL


## YAML

* (class) load_dir: specify directory patterns and pass each YAML file in the matching directories to a block; see [Dir#glob](http://www.ruby-doc.org/core/classes/Dir.html#M002347) for pattern details.
* (class) load_dir_pairs: specify directory patterns and pass each YAML file in the matching directories to a block to process key/value pairs.


## Changes

* 2014-12-17 4.0.0 Add `Pairable` methods; change semantics of `Hash#map_pair`
* 2013-08-19 3.0.1 Update for Code Climate, Travis CI, gem dependencies
* 2013-08-18 3.0.0 Update to Ruby 2
* 2012-09-01 2.1.7 Add Numeric#floor_precision
* 2012-03-14 2.1.6 Update docs, tests
* 2.1.6 Refactor XML#strip* methods to new sixarm_ruby_xml_strip gem.
* 2.1.5 Refactor XML#load* methods to new sixarm_ruby_xml_load gem.
* 2.1.4 Refactor REXML extensions to new sixarm_ruby_rexml gem.
* 2.1.3 Remove dependency on sixarm_ruby_array_slice
* 2.1.2 Refactor Array#slices and #divvy to sixarm_ruby_array_slice gem with better method names.
* 2.1.0 Upgrades for Ruby 1.9.3; better README, new CHANGELOG, less YAML, etc.
* 2.0.x Upgrades for Ruby 1.9.2; add methods; lift some methods to their own gems
* 1.8.x 100% rcov coverage; add methods
* 1.7.x Enable gemcutter; add methods; remove sqlite dependency
* 1.6.x Upgrades for Ruby 1.9.1; improve structure; add methods
* 1.5.0 Combined all Ruby extension files into one gem
* 1.0.0 Original


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind,
express or implied, including but not limited to the warranties of
merchantability, fitness for a particular purpose and noninfringement.

In no event shall the authors or copyright holders be liable for any
claim, damages or other liability, whether in an action of contract,
tort or otherwise, arising from, out of or in connection with the
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights,
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2012 Joel Parker Henderson
