# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Talkie::ActsAsTalker, type: :model do
  context ".class_methods" do
    subject { DummyUser }

    it { is_expected.to respond_to(:acts_as_talker) }
    it { is_expected.to respond_to(:acts_as_commentator ) }
    it { is_expected.to respond_to(:acts_as_speaker) }
    it { is_expected.to respond_to(:acts_as_commenter) }
  end

  context "#instance_methods" do
    subject { DummyUser.new }

    it { is_expected.to have_many(:comments).inverse_of(:creator) }
  end


  describe "associations" do
    describe "comments" do
      it "responds to a comments association" do
        dummy_user = DummyUser.create
        expect(dummy_user.comments.to_a).to eq []
      end
    end
  end
end
