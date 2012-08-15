# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mmcopyrights}
  s.version = "1.2.0"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Micah Martin"]
  s.date = Date.today.to_s
  s.description = %q{Add copyright comments to all your source files}
  s.email = %q{micah@8thlight.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "lib/mmcopyrights.rb", "spec/mmcopyrights_spec.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/slagyr/mmcopyrights}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{MM Copyrights}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end