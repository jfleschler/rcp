# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{json}
  s.version = "1.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Florian Frank"]
  s.date = %q{2011-08-31}
  s.description = %q{This is a JSON implementation as a Ruby extension in C.}
  s.email = %q{flori@ping.de}
  s.executables = ["edit_json.rb", "prettify_json.rb"]
  s.extensions = ["ext/json/ext/parser/extconf.rb", "ext/json/ext/generator/extconf.rb"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["bin/edit_json.rb", "bin/prettify_json.rb", "README.rdoc", "ext/json/ext/parser/extconf.rb", "ext/json/ext/generator/extconf.rb"]
  s.homepage = %q{http://flori.github.com/json}
  s.rdoc_options = ["--title", "JSON implemention for Ruby", "--main", "README.rdoc"]
  s.require_paths = ["ext/json/ext", "ext", "lib"]
  s.rubyforge_project = %q{json}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{JSON Implementation for Ruby}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<permutation>, [">= 0"])
      s.add_development_dependency(%q<bullshit>, [">= 0"])
      s.add_development_dependency(%q<sdoc>, [">= 0"])
    else
      s.add_dependency(%q<permutation>, [">= 0"])
      s.add_dependency(%q<bullshit>, [">= 0"])
      s.add_dependency(%q<sdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<permutation>, [">= 0"])
    s.add_dependency(%q<bullshit>, [">= 0"])
    s.add_dependency(%q<sdoc>, [">= 0"])
  end
end
