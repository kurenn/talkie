# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Talkie::ActsAsCommentable, type: :model do
  context ".class_methods" do
    subject { DummyCommentable }

    it { is_expected.to respond_to(:acts_as_commentable) }
    it { is_expected.to respond_to(:is_commentable) }
  end

  context "#instance_methods" do
    subject { DummyCommentable.new }

    it { is_expected.to have_many(:comments).inverse_of(:commentable) }
  end
end
