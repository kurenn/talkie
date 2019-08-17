# frozen_string_literal: true

require 'rails/generators/base'

module Talkie
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../app/views/talkie', __dir__)

      def copy_views
        directory 'notifications_mailer', 'app/views/talkie/notifications_mailer'
      end

      def copy_comments_views
        directory 'comments', 'app/views/talkie/comments'
      end
    end
  end
end
