# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talkie::Subscription, type: :model do
  let(:user) { DummyUser.create }
  let(:commentable) { DummyCommentable.create }
  let(:comment) { Talkie::Comment.create(body: "A sample body",
                                     commentable: commentable,
                                     creator: user) }

  let(:subscription) { Talkie::Subscription.new(subscriber: user,
                                                comment: comment) }

  subject { subscription }

  it { is_expected.to belong_to(:subscriber).inverse_of(:subscriptions) }
  it { is_expected.to belong_to(:comment).inverse_of(:subscriptions) }

  it { is_expected.to validate_presence_of(:subscriber) }
  it { is_expected.to validate_presence_of(:comment) }
  it { is_expected.to validate_uniqueness_of(:comment).scoped_to(:subscriber_type, :subscriber_id) }

end
