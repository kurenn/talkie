# frozen_string_literal: true

require "talkie/version"
require "talkie/engine"
require "awesome_nested_set"
require "blueprinter"

module Talkie

  @@default_comments_scope = -> { order(created_at: :desc) }
  mattr_accessor :default_comments_scope

  @@comment_creator_handler = :email
  mattr_accessor :comment_creator_handler

  @@creator_path = lambda { |_user, _router| "#" }
  mattr_accessor :creator_path

  @@creator_avatar_url = lambda { |_user| "//api.adorable.io/avatars/40/abott@adorable.png" }
  mattr_accessor :creator_avatar_url

  @@enable_mentions = false
  mattr_accessor :enable_mentions

  @@mentions_scope_query = lambda { |query| where("email LIKE ?", "#{query}%") }
  mattr_accessor :mentions_scope_query

  def self.mentions_enabled?
    @@enable_mentions
  end

  @@enable_mentions_notifications = true
  mattr_accessor :enable_mentions_notifications

  def self.notifications_mentions_enabled?
    @@enable_mentions_notifications
  end

  @@autocomplete_mention_display = lambda { |mentionee| mentionee.email }
  mattr_accessor :autocomplete_mention_display

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
