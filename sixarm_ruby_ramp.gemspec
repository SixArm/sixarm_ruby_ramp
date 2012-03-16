Gem::Specification.new do |s|

  SOURCES             = ['array','class','csv','date','enumerable','file','fixnum','hash','integer','io','kernel','math','nil','numeric','object','process','string','symbol','time','xml','yaml']
  TESTERS             = ['io_test.txt']

  s.name              = "sixarm_ruby_ramp"
  s.summary           = "SixArm.com » Ruby » Ramp gem provides base extensions to ruby classes and rails classes."
  s.version           = "2.1.6"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  top_files           = [".gemtest", "CHANGELOG.txt", "INSTALL.txt", "LICENSE.txt", "Rakefile", "README.md", "VERSION"]
  lib_files           = ["lib/#{s.name}.rb"] + SOURCES.map{|x| "lib/#{s.name}/#{x}.rb"}
  test_files          = ["test/#{s.name}_test.rb"] + SOURCES.map{|x| "test/#{s.name}_test/#{x}_test.rb"} + TESTERS.map{|x| "test/#{s.name}_test/#{x}"}

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

  s.add_dependency('sixarm_ruby_rexml', '>= 2.0.6')
  s.add_dependency('sixarm_ruby_xml_load', '>= 2.0.0')
  s.add_dependency('sixarm_ruby_xml_strip', '>= 2.0.4')

end
