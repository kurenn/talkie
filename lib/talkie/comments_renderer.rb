# frozen_string_literal: true

module Talkie
  class CommentsRenderer
    attr_reader :commentable

    def initialize(view_context, commentable, options = {})
      @view_context = view_context
      @commentable = commentable
      @options = options
    end

    def render
      @view_context.render "talkie/comments/template"
    end

    def nested_enabled?
      @options[:nested] || false
    end

    def display_user_avatar?
      @options[:display_user_avatar] || false
    end

    def display_user_handler?
      @options[:display_user_handler] || false
    end

    def root_comments
      comments = @commentable.root_parents
      comments = comments.includes(:creator) if display_user_info?
      comments = comments.includes(:children) if nested_enabled?

      comments
    end

    private

    def display_user_info?
      display_user_handler? || display_user_avatar?
    end
  end
end
