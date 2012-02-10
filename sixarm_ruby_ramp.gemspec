Gem::Specification.new do |s|

  SOURCES             = ['array','class','csv','date','enumerable','file','fixnum','hash','integer','io','kernel','math','nil','numeric','object','process','string','symbol','time','xml','yaml']
  TESTERS             = ['io_test.txt','xml_test_msword_clean.html','xml_test_msword_dirty.html','xml_test_1.xml','xml_test_2.xml']

  s.name              = "sixarm_ruby_ramp"
  s.summary           = "SixArm.com » Ruby » Ramp gem provides base extensions to ruby classes and rails classes."
  s.version           = "2.1.2"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  top_files           = [".gemtest", "CHANGELOG.txt", "INSTALL.txt", "LICENSE.txt", "Rakefile", "README.rdoc", "VERSION"]
  lib_files           = ["lib/#{s.name}.rb"] + SOURCES.map{|x| "lib/#{s.name}/#{x}.rb"}
  test_files          = ["test/#{s.name}_test.rb"] + TESTERS.map{|x| "test/#{s.name}/#{x}"}

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

  s.add_dependency('sixarm_ruby_array_slice', '>= 2.1.2')

end
