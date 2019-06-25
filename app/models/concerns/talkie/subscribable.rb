# frozen_string_literal: true

module Talkie
  module Subscribable

    def subscribe!(subscriber)
      subscriptions.find_or_create_by(subscriber: subscriber)
    end
  end
end
