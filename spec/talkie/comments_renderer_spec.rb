# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie::CommentsRenderer do
  let(:dummy_commentable)  { DummyCommentable.create }
  subject { Talkie::CommentsRenderer.new(nil, dummy_commentable) }

  it { is_expected.to respond_to(:root_comments) }
  it { is_expected.to respond_to(:nested_enabled?) }
  it { is_expected.to respond_to(:display_user_handler?) }

  describe "#root_comments" do
    let(:dummy_user) { DummyUser.create }
    let!(:comment) { Talkie::Comment.create(body: "A sample body",
                                           commentable: dummy_commentable,
                                           creator: dummy_user) }

    context "with no option set" do
      let(:renderer) { Talkie::CommentsRenderer.new(nil, dummy_commentable, display_user_avatar: false) }

      it "does not include the children comments for the root" do
        expect(renderer.root_comments[0].association(:creator)).not_to be_loaded
        expect(renderer.root_comments[0].association(:children)).not_to be_loaded
      end
    end

    context "with display_user_handler & nested options as true" do
      let(:renderer) { Talkie::CommentsRenderer.new(nil, dummy_commentable, nested: true, display_user_handler: true) }

      it "includes the children comments for the root" do
        expect(renderer.root_comments[0].association(:creator)).to be_loaded
        expect(renderer.root_comments[0].association(:children)).to be_loaded
      end
    end

    context "with display_user_handler option as true" do
      let(:renderer) { Talkie::CommentsRenderer.new(nil, dummy_commentable, display_user_handler: true) }

      it "includes the children comments for the root" do
        expect(renderer.root_comments[0].association(:creator)).to be_loaded
      end
    end

    context "with nested option as true" do
      let(:renderer) { Talkie::CommentsRenderer.new(nil, dummy_commentable, nested: true) }

      it "includes the children comments for the root" do
        expect(renderer.root_comments[0].association(:children)).to be_loaded
      end
    end
  end

  describe "#nested_enabled?" do
    context "with nested option as true" do
      subject { Talkie::CommentsRenderer.new(nil, dummy_commentable, nested: true) }

      it { is_expected.to be_nested_enabled }
    end

    context "with nested option missing" do
      subject { Talkie::CommentsRenderer.new(nil, dummy_commentable) }

      it { is_expected.not_to be_nested_enabled }
    end
  end

  describe "#display_user_handler?" do
    context "with display_user_handler option as true" do
      subject { Talkie::CommentsRenderer.new(nil, dummy_commentable, display_user_handler: true) }

      it { is_expected.to be_display_user_handler }
    end

    context "with display_user_handler option missing" do
      subject { Talkie::CommentsRenderer.new(nil, dummy_commentable) }

      it { is_expected.not_to be_display_user_handler }
    end
  end
end
