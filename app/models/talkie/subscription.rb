# frozen_string_literal: true

module Talkie
  class Subscription < ActiveRecord::Base
    belongs_to :subscriber, polymorphic: true, inverse_of: :subscriptions
    belongs_to :comment, inverse_of: :subscriptions, class_name: "Talkie::Comment"

    validates_presence_of :subscriber, :comment
    validates_uniqueness_of :comment, scope: [:subscriber_type, :subscriber_id]
  end
end
