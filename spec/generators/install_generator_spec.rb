# frozen_string_literal: true

require "spec_helper"
require "generators/talkie/install_generator"

RSpec.describe Talkie::Generators::InstallGenerator, type: :generator do

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
    end
  end
end
