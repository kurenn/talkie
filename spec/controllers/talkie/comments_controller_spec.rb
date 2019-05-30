require "rails_helper"
require "support/mock_calls"

RSpec.describe Talkie::CommentsController, type: :controller do
  routes { Talkie::Engine.routes }
  let(:user) { DummyUser.create }
  let(:commentable) { DummyCommentable.create }


  describe "#create" do
    context "when there is no user logged in" do
      before do
        sign_out
      end

      it "won't post a comment" do
        post :create, params: { comment: { body: "A sample body",
                                           commentable_type: "DummyCommentable",
                                           commentable_id: commentable.id } }

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when there is a user logged in" do
      before do
        sign_in user
      end

      it "will redirect to commentable" do
        post :create, params: { comment: { body: "A sample body",
                                           commentable_type: "DummyCommentable",
                                           commentable_id: commentable.id } }

        expect(assigns(:comment)).to be_persisted
        expect(response).to redirect_to dummy_commentable_path(commentable)
      end

      it "will create the comment" do
        expect { post :create, params: { comment: { body: "A sample body",
                                           commentable_type: "DummyCommentable",
                                           commentable_id: commentable.id } } }.to change { Talkie::Comment.count }.by(1)
      end

      context "when the comment is not a reply" do
        before do
          @parent_comment = Talkie::Comment.create(body: "A sample body",
                                                   commentable: commentable,
                                                   creator: DummyUser.create)
        end

        it "will create the simple comment" do
          expect { post :create, params: { comment: { body: "A sample body",
                                                      commentable_type: "DummyCommentable",
                                                      commentable_id: commentable.id } } }.not_to change { @parent_comment.reload.children_count }

        end
      end

      context "when the comment is a reply" do
        before do
          @parent_comment = Talkie::Comment.create(body: "A sample body",
                                                   commentable: commentable,
                                                   creator: DummyUser.create)
        end

        it "will create the nested reply for the comment" do
          expect { post :create, params: { parent_comment_id: @parent_comment.id,
                                           comment: { body: "A sample body",
                                                      commentable_type: "DummyCommentable",
                                                      commentable_id: commentable.id } } }.to change { @parent_comment.reload.children_count }.by(1)

        end
      end
    end
  end

  describe "#destroy" do
    let!(:comment) { Talkie::Comment.create(body: "A sample body", commentable: commentable, creator: user) }

    context "when there is no user logged in" do
      before do
        sign_out
      end

      it "won't delete the comment" do
        delete :destroy, params: { id: comment.id }

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when the user is logged in" do
      before do
        sign_in user
      end

      context "and created the comment" do
        it "deletes the comment" do
          expect { delete :destroy, params: { id: comment.id } }.to change { Talkie::Comment.count }.by(-1)
        end
      end

      context "and did not created the comment" do
        it "won't delete the comment" do
          another_user_comment = Talkie::Comment.create(body: "A sample body",
                                                commentable: commentable,
                                                creator: DummyUser.create)

          delete :destroy, params: { id: another_user_comment.id }

          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
