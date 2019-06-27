# frozen_string_literal: true

module Talkie
  class Comment < ActiveRecord::Base
    include Talkie::Subscribable
    attr_accessor :mention_tokens

    default_scope Talkie.default_comments_scope

    acts_as_nested_set :scope => [:commentable_id, :commentable_type],
                       :counter_cache => :children_count

    belongs_to :creator, polymorphic: true, inverse_of: :comments
    belongs_to :commentable, polymorphic: true, inverse_of: :comments

    has_many :subscriptions, dependent: :destroy, inverse_of: :comment

    validates :body, :creator, :commentable, presence: true

    before_create :check_for_mentions!, if: :mentions?

    def check_for_mentions!
      subscribers.each do |subscriber|
        self.subscriptions.build(subscriber: subscriber)
      end
    end

    def mentions?
      mention_tokens.present?
    end

    private

    def subscribers
      @subscribers ||= mentionee_klass.find(subscriber_ids)
    end

    def subscriber_ids
      @subscriber_ids ||= mentions.map { |mention| mention["id"] }
    end

    def mentionee_klass
      @mentionee_klass ||= mentions.first["type"].constantize
    end

    def mentions
      @mentions ||= JSON.parse(mention_tokens)
    end
  end
end
