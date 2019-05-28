# frozen_string_literal: true

require "talkie/version"
require "talkie/engine"
require "active_record"
require "awesome_nested_set"

module Talkie
  class Error < StandardError; end
  # Your code goes here...
end

require "talkie/acts_as_talker"
require "talkie/acts_as_commentable"
