Gem::Specification.new do |s|
  s.name        = "flicks"
  s.version     = "1.0.0"
  s.author      = "Pieguy Designs"
  s.email       = "nicholas.piaskoski@gmail.com"
  s.summary     = "Plays and reviews movies(sorta)"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.homepage    = "https://nickpie.com"
  s.files       = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files  = Dir["spec/**/*"]
  s.executables = [ 'flicks' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
