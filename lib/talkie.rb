# frozen_string_literal: true

require "talkie/version"
require "talkie/engine"
require "awesome_nested_set"

module Talkie

  @@default_comments_scope = -> { order(created_at: :desc) }
  mattr_accessor :default_comments_scope

  def self.configure
    yield self
  end
end

require "talkie/acts_as_talker"
require "talkie/acts_as_commentable"
require "talkie/permission"
require "talkie/controller"
require "talkie/renderer_helper"
