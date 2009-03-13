require 'rake'
require 'spec/rake/spectask'
require 'rake/gempackagetask'

task :default => :spec

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

task :copyrights do
  require 'mmcopyrights'
  copyright = "Copyright © 2009 Micah Martin.\nMM Copyrights and all included source files are distributed under terms of the GNU LGPL."
  MM::Copyrights.process('lib', "rb", "#-", copyright)
  MM::Copyrights.process('spec', "rb", "#-", copyright)
end
