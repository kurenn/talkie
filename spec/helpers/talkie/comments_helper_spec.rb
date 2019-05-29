require "rails_helper"

RSpec.describe Talkie::CommentsHelper, type: :helper do
  let(:dummy_commentable) { DummyCommentable.create }

  describe "#talkie_on" do
    it "returns a form with the correct path to post" do
      expect(helper.talkie_on(dummy_commentable)).to include "talkie/comments"
    end
  end
end
