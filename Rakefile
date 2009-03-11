require 'rake'
require 'spec/rake/spectask'
require 'rake/gempackagetask'

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.rcov = false
end

PKG_NAME = "mmcopyrights"
PKG_VERSION   = "1.0"
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

spec = Gem::Specification.new do |s|
  s.name = PKG_NAME
  s.version = PKG_VERSION
  s.files = FileList['lib/**/*', 'spec/**/*', 'bin/**/*', 'CHANGES', 'Rakefile'].to_a
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

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end

task :verify_user do
  raise "RUBYFORGE_USER environment variable not set!" unless ENV['RUBYFORGE_USER']
end

task :verify_password do
  raise "RUBYFORGE_PASSWORD environment variable not set!" unless ENV['RUBYFORGE_PASSWORD']
end


desc "Publish gem+tgz+zip on RubyForge. You must make sure lib/version.rb is aligned with the CHANGELOG file"
task :publish_packages => [:verify_user, :verify_password, :package, :copy_player_gems] do
  require 'meta_project'
  require 'rake/contrib/xforge'
  release_files = FileList[
    "pkg/#{PKG_FILE_NAME}.gem",
  ]

  Rake::XForge::Release.new(MetaProject::Project::XForge::RubyForge.new("sparring")) do |xf|
    # Never hardcode user name and password in the Rakefile!
    xf.user_name = ENV['RUBYFORGE_USER']
    xf.password = ENV['RUBYFORGE_PASSWORD']
    xf.files = release_files.to_a
    xf.release_name = "MM Copyrights #{PKG_VERSION}"
  end
end