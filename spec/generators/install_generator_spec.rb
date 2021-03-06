# frozen_string_literal: true

require "rails_helper"
require "generators/talkie/install_generator"
require "pry"

RSpec.describe Talkie::Generators::InstallGenerator, type: :generator do

  before do
    FileUtils.mkdir "tmp/config"
    FileUtils.touch "tmp/config/routes.rb"
  end

  describe "initializer" do
    it "is copied to the application" do
      run_generator
      initializer = file "config/initializers/talkie.rb"

      expect(initializer).to exist
      expect(initializer).to have_correct_syntax
      expect(initializer).to contain("Talkie.configure do |config|")
    end
  end

  describe "create_talkie_migration" do
    it "creates the comments installation migration" do
      run_generator

      migration = migration_file("db/migrate/create_talkie_comments.rb")

      expect(migration).to exist
      expect(migration).to have_correct_syntax
      expect(migration).to contain("create_table :talkie_comments")
      expect(migration).to contain("create_table :talkie_subscriptions")
    end
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :action_controller
    with.library :active_model
    with.library :active_record
  end
end
