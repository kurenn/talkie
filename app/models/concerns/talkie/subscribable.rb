# frozen_string_literal: true

module Talkie
  module Subscribable

    def subscribe!(subscriber)
      subscriptions.find_or_create_by(subscriber: subscriber)
    end

    def unsubscribe!(subscriber)
      subscription = subscriptions.find_by(subscriber: subscriber)
      raise Talkie::SubscriptionError if subscription.nil?

      subscriptions.find_by(subscriber: subscriber).destroy
    end
  end
end
