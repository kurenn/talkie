# frozen_string_literal: true

require "talkie/version"
require "talkie/engine"
require "awesome_nested_set"

module Talkie
  class Error < StandardError; end

  def self.configure
    yield self
  end
end

require "talkie/acts_as_talker"
require "talkie/acts_as_commentable"
