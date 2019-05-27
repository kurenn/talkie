require "spec_helper"

RSpec.describe Talkie::CommentsController, type: :controller do
  routes { Talkie::Engine.routes }
  let(:user) { DummyUser.create }
  let(:commentable) { DummyCommentable.create }

  before do
    def sign_in(user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    def sign_out
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    end
  end

  describe "#create" do
    context "when there is no user logged in" do
      before do
        sign_out
      end

      it "won't post a comment" do
        post :create, params: { comment: { body: "A sample body",
                                           commentable_type: "DummyCommentable",
                                           commentable_id: commentable.id } }

        expect(response).to have_http_status(:forbidden)
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

        expect(response).to redirect_to commentable
        expect(assigns(:comment).errors).to be_empty
      end

      it "will create the comment" do
        expect { post :create, params: { comment: { body: "A sample body",
                                           commentable_type: "DummyCommentable",
                                           commentable_id: commentable.id } } }.to change { Talkie::Comment.count }.by(1)
      end
    end

  end
end
