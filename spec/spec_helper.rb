# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "rails/all"
require "dummy/application"
require "rspec/rails"
require "shoulda-matchers"

require "ammeter/rspec/generator/example"
require "ammeter/rspec/generator/matchers"
require "ammeter/init"

require 'rails-controller-testing'

Dummy::Application.initialize!

Rails::Controller::Testing.install

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.example_status_persistence_file_path = ".rspec_status"
  config.order = :random
  config.use_transactional_fixtures = true

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
