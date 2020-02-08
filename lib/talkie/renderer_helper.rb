# frozen_string_literal: true

require "talkie/comments_renderer"

module Talkie
  module RendererHelper
    extend ActiveSupport::Concern

    DELEGATED_METHODS_TO_COMMENTS_RENDERER = %i[commentable
                                                root_comments].freeze

    DELEGATED_METHODS_TO_COMMENTS_RENDERER_HELPER = %i[nested_enabled?
                                                       display_user_handler?
                                                       display_user_avatar?
                                                       deletable?].freeze

    HELPER_METHODS = %i[talkie_on
                        root_comments
                        commentable].freeze

    included do
      delegate *DELEGATED_METHODS_TO_COMMENTS_RENDERER, to: :comments_renderer
      if respond_to?(:helper_method)
        helper_method *HELPER_METHODS
      end

      delegate *DELEGATED_METHODS_TO_COMMENTS_RENDERER_HELPER, to: :comments_renderer_helper
      if respond_to?(:helper_method)
        helper_method *DELEGATED_METHODS_TO_COMMENTS_RENDERER_HELPER
      end
    end

    protected

    def talkie_on(*args)
      options = args.extract_options!
      Talkie.options.merge! options

      commentable = args[0]

      @comments_renderer ||= Talkie::CommentsRenderer.new(view_context, commentable)

      @comments_renderer.render
    end

    def comments_renderer
      @comments_renderer ||= Talkie::CommentsRenderer.new(view_context, DummyCommentable.first)
    end

    def comments_renderer_helper
      @comments_renderer_helper ||= Talkie::CommentsRendererHelper.new
    end
  end
end
