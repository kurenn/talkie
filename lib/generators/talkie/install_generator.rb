# frozen_string_literal: true

require 'rails/generators'

module Talkie
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_talkie_initializer
        copy_file 'talkie.rb', 'config/initializers/talkie.rb'
      end
    end
  end
end
