# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie::Comment, type: :model do
  let(:user) { DummyUser.new }
  let(:commentable) { DummyCommentable.new }

  it { is_expected.to respond_to(:body) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:creator) }
  it { is_expected.to validate_presence_of(:commentable) }

  it { is_expected.to belong_to(:creator).inverse_of(:comments) }
  it { is_expected.to belong_to(:commentable).inverse_of(:comments) }

  describe "#owns_comment?" do
    before do
      @comment = Talkie::Comment.new(body: "A sample body",
                                     commentable: commentable,
                                     creator: user)
    end

    context "when the comment was created by the talker" do
      it "will return true" do
        expect(user.owns_comment?(@comment)).to be_truthy
      end
    end
    context "when the comment was not created by the talker" do
      it "will return false" do
        other_user = DummyUser.new
        expect(other_user.owns_comment?(@comment)).to be_falsy
      end
    end
  end
end
