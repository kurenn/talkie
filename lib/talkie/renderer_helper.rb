# frozen_string_literal: true

require "talkie/comments_renderer"

module Talkie
  module RendererHelper
    extend ActiveSupport::Concern

    included do
      delegate :commentable, :root_comments, :nested_enabled?, :display_user_handler?, to: :comments_renderer
      helper_method :talkie_on, :nested_enabled?, :display_user_handler?, :root_comments, :commentable
    end

    protected

    def talkie_on(*args)
      options = args.extract_options!
      commentable = args[0]

      @comments_renderer ||= Talkie::CommentsRenderer.new(view_context, commentable, options)

      @comments_renderer.render
    end

    def comments_renderer
      @comments_renderer
    end

  end
end
