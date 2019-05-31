# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie::CommentsRenderer do
  let(:dummy_commentable)  { DummyCommentable.create }
  subject { Talkie::CommentsRenderer.new(nil, dummy_commentable) }

  it { is_expected.to respond_to(:root_comments) }

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
