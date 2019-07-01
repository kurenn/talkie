require "rails_helper"

RSpec.describe Talkie do
  let(:dummy_user) { DummyUser.create }
  it { is_expected.to respond_to(:default_comments_scope) }
  it { is_expected.to respond_to(:success_redirect_to) }
  it { is_expected.to respond_to(:fail_redirect_to) }

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
