# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github-search/version'

Gem::Specification.new do |spec|
  spec.name          = "github-search"
  spec.version       = GithubSearch::VERSION
  spec.authors       = ["Laura Eck"]
  spec.email         = ["laura.tatsutahime@gmail.com"]
  spec.summary       = %q{A wrapper for the Github Search API}
  spec.description   = %q{This gem wraps the Github Search API and allows you to search users, repositories and issues}
  spec.homepage      = "https://github.com/Morred/github-search"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", '~> 5.5'
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "webmock", "~> 1.20"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "json", "~> 1.8"
end
