# frozen_string_literal: true

require "spec_helper"

RSpec.describe Talkie::Comment, type: :model do
  it { is_expected.to respond_to(:body) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:creator) }

  it { is_expected.to belong_to(:creator).inverse_of(:comments) }
  it { is_expected.to belong_to(:commentable).inverse_of(:comments) }
end
