# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cacofonix/version"

Gem::Specification.new do |spec|
  spec.name         = "cacofonix"
  spec.version      = Cacofonix::VERSION
  spec.authors      = ["James Healy", "Tim Riley"]
  spec.email        = ["jimmy@deefa.com", "tim@icelab.com.au"]

  spec.summary      = "ONIX support for Ruby applications"
  spec.description  = spec.summary
  spec.homepage     = "https://github.com/icelab/cacofonix"
  spec.license      = "MIT"

  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = spec.homepage
  spec.metadata["changelog_uri"]    = "https://github.com/icelab/cacofonix/blob/master/CHANGELOG.md"

  spec.files        = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.5'

  spec.add_runtime_dependency "dry-core", "~> 0.4"
  spec.add_runtime_dependency "roxml", "~> 4.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.0"
  spec.add_runtime_dependency "cacofonix-dtds", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
