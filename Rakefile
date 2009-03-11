require 'rake'
require 'spec/rake/spectask'
require 'rake/gempackagetask'

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = false
end

spec = eval(IO.read('mmcopyrights.gemspec'))

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end