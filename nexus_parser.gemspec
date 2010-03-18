# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nexus_parser}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mjy"]
  s.date = %q{2010-03-17}
  s.description = %q{A full featured and extensible Nexus file parser in Ruby. }
  s.email = %q{diapriid@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "MIT-LICENSE",
     "README",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "init.rb",
     "install.rb",
     "lib/lexer.rb",
     "lib/nexus_file.rb",
     "lib/parser.rb",
     "lib/tokens.rb",
     "tasks/nexus_parser_tasks.rake",
     "test/MX_test_03.nex",
     "test/test.nex",
     "test/test_nexus_parser.rb",
     "uninstall.rb"
  ]
  s.homepage = %q{http://github.com/mjy/nexus_parser}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A Nexus file format (phylogenetic inference) parser in Ruby.}
  s.test_files = [
    "test/test_nexus_parser.rb"
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

