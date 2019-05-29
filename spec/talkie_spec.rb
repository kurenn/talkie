require "rails_helper"

RSpec.describe Talkie do
  it { is_expected.to respond_to(:default_comments_scope) }

  it "has a version number" do
    expect(Talkie::VERSION).not_to be nil
  end

  it "returns the comments in descending order, from newest to oldest" do
    Talkie.configure do |config|
      config.default_comments_scope = -> { 5 }
    end

    expect(Talkie.default_comments_scope.call).to eql 5
  end
end
