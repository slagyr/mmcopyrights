require 'rake'
require 'spec/rake/spectask'
require 'rake/gempackagetask'

task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = false
end

Rake::GemPackageTask.new(eval(IO.read('mmcopyrights.gemspec'))) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

task :copyrights do
  require 'mmcopyrights'
  copyright = "Copyright © 2009 Micah Martin.\nMM Copyrights and all included source files are distributed under terms of the GNU LGPL."
  MM::Copyrights.process('lib', "rb", "#-", copyright)
  MM::Copyrights.process('spec', "rb", "#-", copyright)
end
