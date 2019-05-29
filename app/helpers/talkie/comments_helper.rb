module Talkie
  module CommentsHelper
    def talkie_on(commentable, options = {})
      render "talkie/comments/template", commentable: commentable
    end
  end
end
