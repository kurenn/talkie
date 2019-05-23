# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "rails/all"
require "rspec/rails"

require "ammeter/rspec/generator/example"
require "ammeter/rspec/generator/matchers"
require "ammeter/init"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each, type: :generator) do
    destination File.expand_path("../../tmp", __FILE__)
    prepare_destination
  end
end
