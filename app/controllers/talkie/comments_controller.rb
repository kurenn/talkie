module Talkie
  class CommentsController < ::ApplicationController
    before_action :set_user, :ensure_authenticated_user
    before_action :set_comment, :correct_user!, only: [:destroy]

    def create
      @comment = Talkie::Comment.new(comment_params)
      @comment.creator = @user

      respond_to do |format|
        if @comment.save
          format.html { redirect_to @comment.commentable, notice: "Comment was successfully added." }
          format.js
        else
          format.html { redirect_to :back, notice: "Something went wrong, blank comments are not allowed" }
          format.js
        end
      end
    end

    def destroy
      @comment.destroy
      redirect_to @comment.commentable
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end

    def correct_user!
      redirect_back fallback_location: root_path, status: :unauthorized unless @user.owns_comment?(@comment)
    end

    def set_comment
      @comment = Talkie::Comment.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def ensure_authenticated_user
      redirect_back fallback_location: root_path, status: :forbidden if @user.nil?
    end
  end
end
