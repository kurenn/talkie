# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  add_filter "lib/generators/talkie/templates/"
  add_filter "lib/talkie/version.rb"
end

require "rspec/core"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # The settings below are suggested to provide a good initial experience
  # with RSpec, but feel free to customize to your heart's content.
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed

  config.example_status_persistence_file_path = ".rspec_status"

  config.before(:each, type: :helper) do
    def comments_path
      @comments_path ||= Talkie::Engine.routes.url_helpers.comments_path
    end
  end

  config.before(:each, type: :generator) do
    destination File.expand_path("../../tmp", __FILE__)
    prepare_destination
  end

  config.before(:each) do
    allow_any_instance_of(Talkie::NotificationsMailer).to receive(:mentioned).and_return(true)
  end
end
