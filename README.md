# SixArm.com → Ruby → <br> Ramp is a toolkit of Ruby extensions

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_ramp.svg)](http://badge.fury.io/rb/sixarm_ruby_ramp)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_ramp.png)](https://travis-ci.org/SixArm/sixarm_ruby_ramp)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_ramp.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_ramp)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_ramp/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_ramp?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_ramp>
* Doc: <http://sixarm.com/sixarm_ruby_ramp/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_ramp>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

Ramp is a library of extensions to Ruby base classes.

We extend Array, Date, Enumerable, Hash, Kernel, Numeric, Object, Process, String, Time, and YAML.

For docs go to <http://sixarm.com/sixarm_ruby_ramp/doc>

Want to help? We're happy to get pull requests.


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_ramp

Or add this to your Gemfile:

    gem 'sixarm_ruby_ramp'

### Require

To require the gem in your code:

    require 'sixarm_ruby_ramp'

<!--install-shut-->


## Array

* car, cdr: aka first, rest (see shifted)
* choice, choices: one or more random elements from an array
* cross: return the cross pairings of an array with another array
* divvy: divides an array, like a pie, into a specified number of slices (deprecated)
* onto: return a hash that maps an array's keys on to another array's values
* rotate: moves the first element of an array to the end
* rest: return the rest of the items of the array (aka cdr, aka shifted)
* shifted, shifted!: return an array with the first n items shifted (aka cdr, aka rest)
* shuffle, shuffle!: randomly sort an array efficiently (backport)
* slices: divide an array into specified number of equal size sub-arrays (deprecated)
* to_csv: join a 2D array to a string as CSV (Comma Separated Values)
* to_tdf: join a 2D array to a string as TDF (Tab Delimited Format)
* to_tsv: join a 2D array to a string as TSV (Tab Separated Values)
* union: set union of the sub-arrays.


### Array join

* join: enhances #join with optional prefix, suffix, and infix.
* join_prefix_suffix: join with a prefix and suffix.
* join_prefix_suffix_infix: join with a prefix, suffix, and infix.


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
* hash_by: convert the object to a hash by mapping each item to a key=>value pair.
* index_by: convert the object to a hash by mapping each item to a key=>item pair.
* join: forwards to self.to_a.join
* to_h: convert the object to a hash by mapping each item to a key=>value pair.
* to_h_merge: `to_h` and merge any duplicate keys.
* power_set: return an array with all subsets of the enum's elements


### Enumerable map

* map_id: return the id of an Enumerable object; *requires* that the object respond to an 'id' message
* map_to_a, map_to_f, map_to_i, map_to_s, map_to_sym: convert each object to a specific type by calling its respective method to_a, to_i, to_f, to_s, to_sym
* map_with_index: for each item, yield to a block with the item and its incrementing index


### Enumerable nitems

* nitems_while: the number of leading elements for which block is truthy.
* nitems_until: the number of leading elements for which block is falsey.
* nitems_with_index: the number of leading elements for which block with index is truthy.


### Enumerable select

* select_while: return an array of the leading elements for which block is truthy.
* select_until: return an array of the leading elements for which block is falsey.
* select_with_index: return an array of the leading elements for which block with index is truthy.


## File

* File.joindir: wrapper for File.join(File.dirname(...),string,...)


## Fixnum

* even?: is the number even?
* odd?: is the number odd?


## Hash

* size?: return true if hash has any keys
* sort_by_keys: return a new Hash sorted by keys
* each_sort: sort the keys then call each
* each_key!: pass each key to a block; update hash in place with changes.
* each_pair!: pass each key value pair to a block; update hash in place with changes.
* each_value!: pass each value to a block; update hash in place with changes.
* map_key: map each key-value pair's key by calling a a block
* map_pair: map each key-value pair by calling a a block
* map_value: map each key-value pair by calling a a block
* merge_recurse: merge two hashes plus recurse whenever a key is a hash.
* pivot: aggregates subtotals by keys and values, such as a rollup and rolldown
* yield_pair: yield each key-value pair by calling a a block


## Integer

* rbit: reverse bit
* maps: syntactic sugar to yield n times to a block, returning an array of any results
* odd?: is the number odd?


## IO

* readrow: reads a row line as with IO#readline, and return the row split it into fields
* IO.readrows: reads a file and splits text to rows and fields as a 2D array.


## Kernel

* my_method_name: return the name of the current method
* caller_method_name: return the name of the caller method, or the Nth parent up the call stack.


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
* decrement: decrease the rightmost natural number, with step option.
* increment: increase the rightmost natural number, with step option.
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
