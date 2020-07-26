# frozen_string_literal: true
require 'forwardable'

module Talkie
  class CommentsRendererHelper
    attr_reader :options

    def initialize
      @options = Talkie.options
    end

    def nested_enabled?
      @options[:nested]
    end

    def deletable?
      @options[:deletable]
    end

    def display_user_avatar?
      @options[:display_user_avatar]
    end

    def display_user_handler?
      @options[:display_user_handler]
    end

    def display_user_info?
      display_user_handler? || display_user_avatar?
    end
  end

  class CommentsRenderer
    extend Forwardable
    attr_reader :commentable

    def_delegators :@comments_renderer_helper, :display_user_info?, :nested_enabled?

    def initialize(view_context, commentable)
      @view_context = view_context
      @commentable = commentable
      @comments_renderer_helper = Talkie::CommentsRendererHelper.new
    end

    def render
      @view_context.render "talkie/comments/template"
    end

    def root_comments
      comments = @commentable.root_parents
      comments = comments.includes(:creator) if display_user_info?
      comments = comments.includes(:children) if nested_enabled?

      comments
    end
  end
end
