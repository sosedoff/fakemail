Gem::Specification.new do |s|
  s.name        = "fakemail"
  s.version     = "0.2.0"
  s.summary     = "Sendmail replacement to debug email output."
  s.description = "Provides a fake sendmail binary to store email output for email dubugging purposes."
  s.homepage    = "http://github.com/sosedoff/fakemail"
  s.authors     = ["Dan Sosedoff"]
  s.email       = ["dan.sosedoff@gmail.com"]
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.require_paths = ["lib"]
  s.default_executable = 'fakemail'
end