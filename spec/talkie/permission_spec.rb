# frozen_string_literal: true

require "rails_helper"

RSpec::Matchers.define :allow_to do |action, comment|
  match do |permission|
    permission.allow?(action, comment) == true
  end
end

RSpec.describe Talkie::Permission do
  let(:dummy_user) { DummyUser.create }
  let(:dummy_commentable) { DummyCommentable.create }
  let(:comment) { Talkie::Comment.create(body: "A sample body",
                                         commentable: dummy_commentable,
                                         creator: dummy_user) }
  describe "as guest" do
    subject { Talkie::Permission.new(nil) }

    it { is_expected.not_to allow_to(:destroy, comment) }
    it { is_expected.not_to allow_to(:create, comment) }
  end

  describe "as logged in user" do
    subject { Talkie::Permission.new(dummy_user) }

    it { is_expected.to allow_to(:create, comment) }

    context "when the user owns the comment" do
      it { is_expected.to allow_to(:destroy, comment) }
    end

    context "when the user doesn't own the comment" do
      let(:another_user) { DummyUser.create }
      let(:another_comment) { Talkie::Comment.create(body: "A sample body",
                                             commentable: dummy_commentable,
                                             creator: another_user) }

      it { is_expected.not_to allow_to(:destroy, another_comment) }
    end
  end
end
