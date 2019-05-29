# frozen_string_literal: true

module Talkie
  class CommentsRendererHelper
    def initialize(view_context, commentable, options = {})
      @view_context = view_context
      @commentable = commentable
      @options = options
    end

    def render
      @view_context.render "talkie/comments/template", commentable: @commentable, renderer: self
    end

    def nested_enabled?
      @options[:nested] || false
    end
  end
end
