# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "twitmap/version"

Gem::Specification.new do |s|
  s.name        = "twitmap"
  s.version     = Twitmap::VERSION
  s.authors     = ["Chris Parker"]
  s.email       = ["mrcsparker@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Search twitter hashtags}
  s.description = %q{Search twitter hashtags and return results as links}

  s.rubyforge_project = "twitmap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("rspec", "~> 2.6.0")
  s.add_development_dependency("bundler", ">= 1.0.15")
  s.add_development_dependency("webmock", "~> 1.6")

  s.add_dependency("twitter", "~> 1.6.2")
end
