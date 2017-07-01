# -*- encoding: utf-8 -*-
# stub: debase 0.2.1 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "debase".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dennis Ushakov".freeze]
  s.date = "2015-08-19"
  s.description = "    debase is a fast implementation of the standard Ruby debugger debug.rb for Ruby 2.0.\n    It is implemented by utilizing a new Ruby TracePoint class. The core component\n    provides support that front-ends can build on. It provides breakpoint\n    handling, bindings for stack frames among other things.\n".freeze
  s.email = ["dennis.ushakov@gmail.com".freeze]
  s.extensions = ["ext/extconf.rb".freeze]
  s.files = ["ext/extconf.rb".freeze]
  s.homepage = "https://github.com/denofevil/debase".freeze
  s.rubyforge_project = "debase".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "debase is a fast implementation of the standard Ruby debugger debug.rb for Ruby 2.0".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<debase-ruby_core_source>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<debase-ruby_core_source>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<debase-ruby_core_source>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
