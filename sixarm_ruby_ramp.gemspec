# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_ramp"
  s.summary        = "SixArm.com → Ruby → Ramp provides base extensions to ruby classes."
  s.description    = "Adds extensions to Array, Date, Enumerable, File, Hash, IO, String, Time, etc."
  s.version        = "5.0.2"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["Apache-2.0", "Artistic-2.0", "BSD-3-Clause", "GPL-2.0", "GPL-3.0", "MIT", "MPL-2.0"]

  s.signing_key    = "/opt/key/sixarm/sixarm-ruby-gem-signing-20230504-private.pem"
  s.cert_chain     = ["/opt/key/sixarm/sixarm-ruby-gem-signing-20230504-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"


  s.files = [
    "Rakefile",
    "lib/sixarm_ruby_ramp.rb",
    "lib/sixarm_ruby_ramp/array.rb",
    "lib/sixarm_ruby_ramp/array/join.rb",
    "lib/sixarm_ruby_ramp/array/shuffle.rb",
    "lib/sixarm_ruby_ramp/class.rb",
    "lib/sixarm_ruby_ramp/csv.rb",
    "lib/sixarm_ruby_ramp/date.rb",
    "lib/sixarm_ruby_ramp/enumerable.rb",
    "lib/sixarm_ruby_ramp/enumerable/each.rb",
    "lib/sixarm_ruby_ramp/enumerable/map.rb",
    "lib/sixarm_ruby_ramp/enumerable/nitems.rb",
    "lib/sixarm_ruby_ramp/enumerable/select.rb",
    "lib/sixarm_ruby_ramp/file.rb",
    "lib/sixarm_ruby_ramp/fixnum.rb",
    "lib/sixarm_ruby_ramp/hash.rb",
    "lib/sixarm_ruby_ramp/integer.rb",
    "lib/sixarm_ruby_ramp/integer/rbit.rb",
    "lib/sixarm_ruby_ramp/io.rb",
    "lib/sixarm_ruby_ramp/kernel.rb",
    "lib/sixarm_ruby_ramp/math.rb",
    "lib/sixarm_ruby_ramp/nil.rb",
    "lib/sixarm_ruby_ramp/numeric.rb",
    "lib/sixarm_ruby_ramp/object.rb",
    "lib/sixarm_ruby_ramp/pairable.rb",
    "lib/sixarm_ruby_ramp/process.rb",
    "lib/sixarm_ruby_ramp/string.rb",
    "lib/sixarm_ruby_ramp/time.rb",
    "lib/sixarm_ruby_ramp/yaml.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_ramp_test.rb",
    "test/sixarm_ruby_ramp_test/array_test.rb",
    "test/sixarm_ruby_ramp_test/array/join_test.rb",
    "test/sixarm_ruby_ramp_test/array/shuffle_test.rb",
    "test/sixarm_ruby_ramp_test/class_test.rb",
    "test/sixarm_ruby_ramp_test/csv_test.rb",
    "test/sixarm_ruby_ramp_test/date_test.rb",
    "test/sixarm_ruby_ramp_test/enumerable_test.rb",
    "test/sixarm_ruby_ramp_test/enumerable/each_test.rb",
    "test/sixarm_ruby_ramp_test/enumerable/map_test.rb",
    "test/sixarm_ruby_ramp_test/enumerable/nitems_test.rb",
    "test/sixarm_ruby_ramp_test/enumerable/select_test.rb",
    "test/sixarm_ruby_ramp_test/file_test.rb",
    "test/sixarm_ruby_ramp_test/fixnum_test.rb",
    "test/sixarm_ruby_ramp_test/hash_test.rb",
    "test/sixarm_ruby_ramp_test/integer_test.rb",
    "test/sixarm_ruby_ramp_test/integer/rbit_test.rb",
    "test/sixarm_ruby_ramp_test/io_test.rb",
    "test/sixarm_ruby_ramp_test/kernel_test.rb",
    "test/sixarm_ruby_ramp_test/math_test.rb",
    "test/sixarm_ruby_ramp_test/nil_test.rb",
    "test/sixarm_ruby_ramp_test/numeric_test.rb",
    "test/sixarm_ruby_ramp_test/object_test.rb",
    "test/sixarm_ruby_ramp_test/pairable_test.rb",
    "test/sixarm_ruby_ramp_test/process_test.rb",
    "test/sixarm_ruby_ramp_test/string_test.rb",
    "test/sixarm_ruby_ramp_test/time_test.rb",
    "test/sixarm_ruby_ramp_test/yaml_test.rb",
    "test/sixarm_ruby_ramp_test/io_test.txt",
  ]

  s.add_dependency('sixarm_ruby_rexml', '~> 2.1', '>= 2.1.0')
  s.add_dependency('sixarm_ruby_xml_load', '~> 2.1', '>= 2.1.0')
  s.add_dependency('sixarm_ruby_xml_strip', '~> 2.1', '>= 2.1.0')

  s.add_development_dependency("minitest", ">= 5.12", "< 6")
  s.add_development_dependency("sixarm_ruby_minitest_extensions", ">= 1.0.8", "< 2")
  s.add_development_dependency("rake", ">= 12.3.3", "< 13")
  s.add_development_dependency("simplecov", ">= 0.18.0", "< 2")
  s.add_development_dependency("flog", ">= 4.6.1", "< 5")
  s.add_development_dependency("flay", ">= 2.10.0", "< 3")
  s.add_development_dependency("reek", ">= 4.7.3", "< 5")
  s.add_development_dependency("rubycritic", ">= 3.3.0", "< 4")
  s.add_development_dependency("rubocop", ">= 0.52.1", "< 1")

  s.required_ruby_version = ">= 2.3"

end
