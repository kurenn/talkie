# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie::NilMentionTokens do
  let(:nil_user) { Talkie::NilMentionTokens.new }
  it { is_expected.to respond_to(:to_s) }

  describe "#to_s" do
    it "returns a default json structure for mention_tokens" do
      expect(nil_user.to_s).to eq "[{\"type\":\"Talkie::NilMentionTokens\"}]"
    end
  end

  describe ".find" do
    it "returns an empty array" do
      expect(Talkie::NilMentionTokens.find).to eq []
    end
  end
end
