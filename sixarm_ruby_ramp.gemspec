# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  SOURCES          = [
    'array',
    'array/join',
    'array/shuffle',
    'class',
    'csv',
    'date',
    'enumerable',
    'enumerable/map',
    'enumerable/nitems',
    'enumerable/select',
    'file',
    'fixnum',
    'hash',
    'integer',
    'integer/rbit',
    'io',
    'kernel',
    'math',
    'nil',
    'numeric',
    'object',
    'pairable',
    'process',
    'string',
    'symbol',
    'time',
    'xml',
    'yaml'
  ]
  TESTERS          = ["io_test.txt"]

  s.name           = "sixarm_ruby_ramp"
  s.summary        = "SixArm.com » Ruby » Ramp provides base extensions to ruby classes."
  s.description    = "Adds extensions to Array, Date, Enumerable, File, Hash, IO, String, Time, etc."
  s.version        = "4.2.2"
  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key    =  '/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem'
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"
  s.has_rdoc       = true

  top_files        = [".gemtest", "CONTRIBUTING.md", "Rakefile", "README.md", "VERSION"]
  lib_files        = ["lib/#{s.name}.rb"] + SOURCES.map{|x| "lib/#{s.name}/#{x}.rb"}
  test_files       = ["test/#{s.name}_test.rb"] + SOURCES.map{|x| "test/#{s.name}_test/#{x}_test.rb"} + TESTERS.map{|x| "test/#{s.name}_test/#{x}"}

  s.files          = top_files + lib_files + test_files
  s.test_files     = test_files

  s.add_dependency('sixarm_ruby_rexml', '~> 2.1', '>= 2.1.0')
  s.add_dependency('sixarm_ruby_xml_load', '~> 2.1', '>= 2.1.0')
  s.add_dependency('sixarm_ruby_xml_strip', '~> 2.1', '>= 2.1.0')

end
