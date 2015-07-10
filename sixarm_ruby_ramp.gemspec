# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_ramp"
  s.summary        = "SixArm.com » Ruby » Ramp provides base extensions to ruby classes."
  s.description    = "Adds extensions to Array, Date, Enumerable, File, Hash, IO, String, Time, etc."
  s.version        = "4.2.3"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key    =  "/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem"
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"
  s.has_rdoc       = true

  s.files = [
    ".gemtest",
    "CHANGES.md",
    "CONTRIBUTING.md",
    "LICENSE.md",
    "Rakefile",
    "README.md",
    "VERSION",
    "lib/sixarm_ruby_ramp.rb",
    "lib/sixarm_ruby_ramp/array.rb",
    "lib/sixarm_ruby_ramp/array/join.rb",
    "lib/sixarm_ruby_ramp/array/shuffle.rb",
    "lib/sixarm_ruby_ramp/class.rb",
    "lib/sixarm_ruby_ramp/csv.rb",
    "lib/sixarm_ruby_ramp/date.rb",
    "lib/sixarm_ruby_ramp/enumerable.rb",
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
    "lib/sixarm_ruby_ramp/symbol.rb",
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
    "test/sixarm_ruby_ramp_test/symbol_test.rb",
    "test/sixarm_ruby_ramp_test/time_test.rb",
    "test/sixarm_ruby_ramp_test/yaml_test.rb",
    "test/sixarm_ruby_ramp_test/io_test.txt",
  ]

  s.add_dependency('sixarm_ruby_rexml', '~> 2.1', '>= 2.1.0')
  s.add_dependency('sixarm_ruby_xml_load', '~> 2.1', '>= 2.1.0')
  s.add_dependency('sixarm_ruby_xml_strip', '~> 2.1', '>= 2.1.0')

  s.add_development_dependency('minitest', '>= 5.7.0', '< 6')
  s.add_development_dependency('rake', '> 10.4.2', '< 11')
  s.add_development_dependency('simplecov', '>= 0.10.0', '< 2')
  s.add_development_dependency('coveralls', '>= 0.8.2', '< 2')

end
