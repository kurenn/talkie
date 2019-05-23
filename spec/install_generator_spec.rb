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
end
