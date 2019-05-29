# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Talkie::ActsAsCommentable, type: :model do
  let(:dummy_commentable) { DummyCommentable.create }
  let(:user) { DummyUser.create }

  context ".class_methods" do
    subject { DummyCommentable }

    it { is_expected.to respond_to(:acts_as_commentable) }
    it { is_expected.to respond_to(:is_commentable) }
  end

  context "#instance_methods" do
    subject { DummyCommentable.new }

    it { is_expected.to have_many(:comments).inverse_of(:commentable) }

    describe "#root_parents" do
      before do
        @root_comment = Talkie::Comment.create(body: "A sample body",
                                           commentable: dummy_commentable,
                                           creator: user)

        2.times do
          reply = Talkie::Comment.create(body: "A sample body",
                                 commentable: dummy_commentable,
                                 creator: user)

          reply.move_to_child_of @root_comment
        end
      end

      it "sets the children counter cache correctly" do
        expect(@root_comment.children_count).to eql 2
      end

      it "returns the comments which are root parents" do
        expect(Array.wrap(dummy_commentable.root_parents)).to eql [@root_comment]
        expect(Array.wrap(dummy_commentable.root_parents)).to eql [@root_comment]
      end
    end
  end
end
