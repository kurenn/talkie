# frozen_string_literal: true

module Talkie
  class RepliesController < TalkieController
    def index
      @comment = Talkie::Comment.find(params[:comment_id])
      @replies = @comment.replies

      respond_to do |format|
        format.js
      end
    end
  end
end
