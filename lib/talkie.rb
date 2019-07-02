# frozen_string_literal: true

require "talkie/version"
require "talkie/engine"
require "awesome_nested_set"
require "blueprinter"

module Talkie

  mattr_accessor :default_comments_scope,
                 default: -> { order(created_at: :desc) }

  mattr_accessor :comment_creator_handler,
                 default: :email

  mattr_accessor :creator_path,
                 default: lambda { |_user, _router| "#" }

  mattr_accessor :creator_avatar_url,
                 default: lambda { |_user| "//api.adorable.io/avatars/40/abott@adorable.png" }

  mattr_accessor :success_redirect_to,
                 default: lambda { |router, commentable| router.polymorphic_path(commentable) }

  mattr_accessor :fail_redirect_to,
                 default: lambda { |router| router.root_url }

  mattr_accessor :enable_mentions,
                 default: false

  mattr_accessor :mentions_scope_query,
                 default: lambda { |query| where("email LIKE ?", "#{query}%") }


  mattr_accessor :enable_mentions_notifications,
                  default: true

  mattr_accessor :from_mailer_address,
                 default: "no-reply@change-me-to-your-domain.com"

  mattr_accessor :autocomplete_mention_display,
                 default: lambda { |mentionee| mentionee.email }

  def self.mentions_enabled?
    @@enable_mentions
  end

  def self.notifications_mentions_enabled?
    @@enable_mentions_notifications
  end

  def self.configure
    yield self
  end
end

require "talkie/acts_as_talker"
require "talkie/acts_as_commentable"
require "talkie/permission"
require "talkie/controller"
require "talkie/renderer_helper"
require "talkie/subscription_error"
require "talkie/blueprinter"
require "talkie/nil_mention_tokens"
