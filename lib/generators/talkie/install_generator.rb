# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/migration'

module Talkie
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def create_talkie_initializer
        copy_file 'talkie.rb', 'config/initializers/talkie.rb'
      end

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def create_talkie_migration
        migration_template "create_talkie_comments.rb", "db/migrate/create_talkie_comments.rb"
      end
    end
  end
end
