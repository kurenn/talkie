module Talkie
  class CommentsController < TalkieController
    before_action :current_comment, only: [:destroy]

    def create
      @comment = Talkie::Comment.new(comment_params)
      @comment.creator = current_user

      respond_to do |format|
        if @comment.save
          make_child_comment if reply?
          format.html { redirect_to Talkie.success_redirect_to.call(main_app, @comment.commentable), notice: t('talkie.controllers.comments.flash.success') }
          format.js
        else
          format.html { redirect_back fallback_location: Talkie.fail_redirect_to.call(main_app), notice: t('talkie.controllers.comments.flash.error') }
          format.js
        end
      end
    end

    def destroy
      current_comment.destroy
      redirect_to main_app.polymorphic_path(current_comment.commentable)
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end

    def reply?
      params[:parent_comment_id].present?
    end

    def make_child_comment
      parent_comment = Comment.find params[:parent_comment_id]
      @comment.move_to_child_of(parent_comment)
    end

    def current_comment
      @current_comment ||= Talkie::Comment.find_by(id: params[:id])
    end
  end
end
