# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'talkie/version'

Gem::Specification.new do |spec|
  spec.name          = 'talkie'
  spec.version       = Talkie::VERSION
  spec.authors       = ['Abraham Kuri']
  spec.email         = ['kurenn@icalialabs.com']

  spec.summary       = 'A Rails Engine to easily integrate comments'
  spec.description   = 'A Rails Engine to easily integrate comments to any model. Provides views and helpful generators'
  spec.homepage      = 'https://github.com/kurenn/talkie'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'ammeter', '~> 1.1'
  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'jquery-rails', '~> 4.3'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rails-controller-testing', '~> 1.0'
  spec.add_development_dependency 'rails-i18n', '~> 5.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.8'

  spec.add_runtime_dependency 'rails', '>= 5.0'

  spec.add_dependency 'awesome_nested_set', '~> 3.1'
  spec.add_dependency 'blueprinter', '~> 0.18.0'
  spec.add_dependency 'oj', '~> 3.7'
  spec.add_dependency 'sassc-rails', '~> 2.1'
end
