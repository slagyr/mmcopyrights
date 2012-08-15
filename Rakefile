require 'rake'
require 'rspec/core/rake_task'
#require 'rake/gempackagetask'

task :default => :spec

RSpec::Core::RakeTask.new(:spec)

#Rake::GemPackageTask.new(eval(IO.read('mmcopyrights.gemspec'))) do |pkg|
#  pkg.need_zip = true
#  pkg.need_tar = true
#end

task :copyrights do
  require 'mmcopyrights'
  copyright = "Copyright (C) 2009 Micah Martin.\nMM Copyrights and all included source files are distributed under terms of the GNU LGPL."
  MM::Copyrights.process('lib', "rb", "#-", copyright)
  MM::Copyrights.process('spec', "rb", "#-", copyright)
end
