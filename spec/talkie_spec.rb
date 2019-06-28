# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie do
  let(:dummy_user) { DummyUser.create }
  it { is_expected.to respond_to(:default_comments_scope) }
  it { is_expected.to respond_to(:comment_creator_handler) }
  it { is_expected.to respond_to(:creator_path) }
  it { is_expected.to respond_to(:creator_avatar_url) }
  it { is_expected.to respond_to(:enable_mentions) }
  it { is_expected.to respond_to(:mentions_scope_query) }
  it { is_expected.to respond_to(:enable_mentions_notifications) }
  it { is_expected.to respond_to(:from_mailer_address) }
  it { is_expected.to respond_to(:autocomplete_mention_display) }

  context "when mentions is enabled" do
    before do
      Talkie.configure do |config|
        config.enable_mentions = true
      end
    end

    it "returns true" do
      expect(Talkie).to be_mentions_enabled
    end

    it "enabled notifications as well" do
      expect(Talkie).to be_notifications_mentions_enabled
    end
  end

  it "has a version number" do
    expect(Talkie::VERSION).not_to be nil
  end

  it "returns the comments in descending order, from newest to oldest" do
    Talkie.configure do |config|
      config.default_comments_scope = -> { 5 }
    end

    expect(Talkie.default_comments_scope.call).to eql 5
  end

  it "returns email as the default comment_creator_handler option" do
    expect(Talkie.creator_avatar_url.call(dummy_user)).to eql "//api.adorable.io/avatars/40/abott@adorable.png"
  end

  context "when the comment_creater is changed" do
    before do
      Talkie.configure do |config|
        config.creator_avatar_url = lambda { |user| "http://www.gravatar.com/avatar/?d=identicon" }
      end
    end

    it "returns username as the comment_creator_handler when changed" do
      expect(Talkie.creator_avatar_url.call(dummy_user)).to eql "http://www.gravatar.com/avatar/?d=identicon"
    end
  end

  it "returns email as the default comment_creator_handler option" do
    expect(Talkie.comment_creator_handler).to eql :email
  end

  context "when the comment_creater is changed" do
    before do
      Talkie.configure do |config|
        config.comment_creator_handler = :username
      end
    end

    it "returns username as the comment_creator_handler when changed" do
      expect(Talkie.comment_creator_handler).to eql :username
    end
  end
end
