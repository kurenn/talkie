# frozen_string_literal: true

module Talkie
  class RepliesController < TalkieController
    def index
      @comment = current_comment
      @replies = @comment.replies

      respond_to do |format|
        format.js
      end
    end

    def current_comment
      @current_comment ||= Talkie::Comment.find_by(id: params[:comment_id])
    end
  end
end
