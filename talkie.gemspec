# -*- encoding: utf-8 -*-
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "talkie/version"

Gem::Specification.new do |spec|
  spec.name          = "talkie"
  spec.version       = Talkie::VERSION
  spec.authors       = ["Abraham Kuri"]
  spec.email         = ["kurenn@icalialabs.com"]

  spec.summary       = %q{A Rails Engine to easily integrate comments}
  spec.description   = %q{A Rails Engine to easily integrate comments to any model. Provides views and helpful generators}
  spec.homepage      = "https://github.com/kurenn/talkie"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "ammeter"
  spec.add_development_dependency "rspec-rails"

  spec.add_dependency "railties", ">= 4.2"
  spec.add_dependency "activerecord", ">= 4.2"
  spec.add_dependency 'activemodel', '>= 4.2'
end
