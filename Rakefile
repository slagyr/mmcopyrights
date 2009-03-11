require 'rake'
require 'spec/rake/spectask'
require 'rake/gempackagetask'

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = false
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "mmcopyrights"
    s.summary = "MM Copyrights"
    s.email = "micah@8thlight.com"
    s.homepage = "http://github.com/slagyr/mmcopyrights"
    s.description = "Add copyright comments to all your source files"
    s.authors = ["Micah Martin"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

# Gem::Specification.new do |s|
#   s.name = "mmcopyrights"
#   s.version = "1.0"
#   s.files = Dir.glob('lib/**/*') + Dir.glob('spec/**/*') + ['Rakefile']
#   s.require_path = 'lib'
#   s.test_files = Dir.glob('spec/*_spec.rb')
#   s.bindir = 'bin'
#   s.executables = []
#   s.email = "micah@8thlight.com"
#   s.homepage = "http://github.com/slagyr/mmcopyrights"
#   s.summary = "MM Copyrights"
#   s.description = "Add copyright comments to all your source files"
#   s.author = "Micah Martin"
# end

# spec = eval(IO.read('mmcopyrights.gemspec'))
# 
# Rake::GemPackageTask.new(spec) do |pkg|
#   pkg.need_zip = false
#   pkg.need_tar = false
# end