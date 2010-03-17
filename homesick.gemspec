# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{homesick}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Nichols"]
  s.date = %q{2010-03-17}
  s.default_executable = %q{homesick}
  s.description = %q{
    A man’s home (directory) is his castle, so don’t leave home with out it.

    Homesick is sorta like rip, but for dotfiles. It uses git to clone a repository containing dotfiles, and saves them in ~/.homesick. It then allows you to symlink all the dotfiles into place with a single command. 

  }
  s.email = %q{josh@technicalpickles.com}
  s.executables = ["homesick"]
  s.extra_rdoc_files = [
    "ChangeLog.markdown",
     "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "ChangeLog.markdown",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "bin/homesick",
     "homesick.gemspec",
     "lib/homesick.rb",
     "spec/homesick/homesick_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/technicalpickles/homesick}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A man's home is his castle. Never leave your dotfiles behind.}
  s.test_files = [
    "spec/homesick/homesick_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

