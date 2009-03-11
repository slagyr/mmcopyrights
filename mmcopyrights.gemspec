Gem::Specification.new do |s|
  s.name = "mmcopyrights"
  s.version = "1.0"
  s.files = Dir.glob('lib/**/*') + Dir.glob('spec/**/*') + ['Rakefile']
  s.require_path = 'lib'
  s.test_files = Dir.glob('spec/*_spec.rb')
  s.bindir = 'bin'
  s.executables = []
  s.email = "micah@8thlight.com"
  s.homepage = "http://github.com/slagyr/mmcopyrights"
  s.summary = "MM Copyrights"
  s.description = "Add copyright comments to all your source files"
  s.author = "Micah Martin"
end