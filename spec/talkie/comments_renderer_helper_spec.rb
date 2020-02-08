# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie::CommentsRendererHelper do
  subject { Talkie::CommentsRendererHelper.new }

  describe "#nested_enabled?" do
    context "with nested option as true" do
      before do
        options = { nested: true }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.to be_nested_enabled }
    end

    context "with nested option missing" do
      before do
        options = { nested: false }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.not_to be_nested_enabled }
    end
  end

  describe "#display_user_info?" do
    context "with display_user_avatar option as true" do
      before do
        options = { display_user_avatar: true }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.to be_display_user_info }
    end

    context "with display_user_avatar option missing" do
      before do
        options = { display_user_handler: false }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.to be_display_user_info }
    end

    context "with display_user_avatar and display_user_handler option as false" do
      before do
        options = { display_user_avatar: false, display_user_handler: false }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.not_to be_display_user_info }
    end
  end

  describe "#display_user_avatar?" do
    context "with display_user_avatar option as true" do
      before do
        options = { display_user_avatar: true }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.to be_display_user_avatar }
    end

    context "with display_user_avatar option missing" do
      before do
        options = { display_user_avatar: false }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.not_to be_display_user_avatar }
    end
  end

  describe "#display_user_handler?" do
    context "with display_user_handler option as true" do
      before do
        options = { display_user_handler: true }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.to be_display_user_handler }
    end

    context "with nested option missing" do
      before do
        options = { display_user_handler: false }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.not_to be_display_user_handler }
    end
  end

  describe "#deletable?" do
    context "with deletable option as true" do
      before do
        options = { deletable: true }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.to be_deletable }
    end

    context "with deletable option missing" do
      before do
        options = { deletable: false }
        Talkie.options.merge! options
      end

      subject { Talkie::CommentsRendererHelper.new }

      it { is_expected.not_to be_deletable }
    end
  end
end
