# frozen_string_literal: true

module Talkie
  module CommentsHelper
    def talkie_on(commentable, options = {})
      Talkie::CommentsRendererHelper.new(controller.view_context, commentable, options).render
    end
  end
end
