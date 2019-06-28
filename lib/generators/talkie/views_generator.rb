# frozen_string_literal: true

require 'rails/generators/base'

module Talkie
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/views/talkie', __FILE__)

      def copy_views
        directory "notifications_mailer", "app/views/talkie/notifications_mailer"
      end
    end
  end
end
