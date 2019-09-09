# frozen_string_literal: true

require "talkie/comments_renderer"

module Talkie
  module RendererHelper
    extend ActiveSupport::Concern

    DELEGATED_METHODS_TO_COMMENTS_RENDERER = %i[commentable
                                                root_comments
                                                nested_enabled?
                                                display_user_handler?
                                                display_user_avatar?
                                                deletable?].freeze

    HELPER_METHODS = %i[talkie_on
                        nested_enabled?
                        display_user_handler?
                        display_user_avatar?
                        deletable?
                        root_comments
                        commentable].freeze

    included do
      delegate *DELEGATED_METHODS_TO_COMMENTS_RENDERER, to: :comments_renderer
      if respond_to?(:helper_method)
        helper_method *HELPER_METHODS
      end
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
