Gem::Specification.new do |s|

  CLASSES             = ['array','class','csv','date','enumerable','file','fixnum','hash','integer','io','kernel','math','nil','numeric','object','process','string','symbol','time','xml','yaml']
  TEST_FILES          = ['io_test.txt','xml_test_msword_clean.html','xml_test_msword_dirty.html','xml_test_1.xml','xml_test_2.xml','yaml_test_1.yml','yaml_test_2.yml']

  s.name              = "sixarm_ruby_ramp"
  s.summary           = "SixArm Ruby Gem: Ramp gem provides base extensions to ruby classes and rails classes."
  s.version           = "1.8.2"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','LICENSE.txt','lib/sixarm_ruby_ramp.rb'] + CLASSES.map{|c| "lib/sixarm_ruby_ramp/#{c}.rb"} + TEST_FILES.map{|f| "test/sixarm_ruby_ramp/#{f}"}
  s.test_files        = CLASSES.map{|c| "test/sixarm_ruby_ramp/#{c}_test.rb"}

end
