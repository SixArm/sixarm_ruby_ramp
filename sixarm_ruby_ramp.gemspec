Gem::Specification.new do |s|

  NAME                = "sixarm_ruby_ramp"
  SOURCES             = ['array','class','csv','date','enumerable','file','fixnum','hash','integer','io','kernel','math','nil','numeric','object','process','string','symbol','time','xml','yaml']
  TESTERS             = ['io_test.txt','xml_test_msword_clean.html','xml_test_msword_dirty.html','xml_test_1.xml','xml_test_2.xml','yaml_test_1.yml','yaml_test_2.yml']

  s.name              = NAME
  s.summary           = "SixArm.com » Ruby » Ramp gem provides base extensions to ruby classes and rails classes."
  s.version           = "2.0.2"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  s.files             = [".gemtest","Rakefile","README.rdoc","LICENSE.txt"]
                        ["lib/#{NAME}.rb"] + SOURCES.map{|x| "lib/#{NAME}/#{x}.rb"} +
                        ["test/#{NAME}.rb"] + TESTERS.map{|x| "test/#{NAME}/#{x}"}
  s.test_files        = SOURCES.map{|x| "test/#{NAME}/#{x}_test.rb"}

end
