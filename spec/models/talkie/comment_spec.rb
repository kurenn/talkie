# frozen_string_literal: true

require "spec_helper"

module Talkie
  RSpec.describe Comment, type: :model do
    it { is_expected.to respond_to(:body) }
    it { is_expected.to validate_presence_of(:body) }
  end
end
