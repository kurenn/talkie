# frozen_string_literal: true

module Talkie
  module Mentionable
    extend ActiveSupport::Concern

    included do
      attr_writer :mention_tokens

      before_create :check_for_mentions!, if: :mentions?
      after_create :notify_mentionees!, if: :enabled_notifications?
    end

    def check_for_mentions!
      subscribers.each do |subscriber|
        self.subscriptions.build(subscriber: subscriber)
      end
    end

    def mentions?
      mention_tokens.present?
    end

    def notify_mentionees!
      NotificationsMailer.with(comment: self, recipients: subscribers.pluck(:email)).mentioned.deliver_now
    end

    def mention_tokens
      @mention_tokens || Talkie::NilMentionTokens.new.to_s
    end

    private

    def subscribers
      @subscribers ||= mentionee_klass.find(subscriber_ids)
    end

    def subscriber_ids
      @subscriber_ids ||= mentions.map { |mention| mention["id"] }
    end

    def mentionee_klass
      @mentionee_klass ||= mentions.first["type"]&.constantize
    end

    def mentions
      @mentions ||= JSON.parse(mention_tokens)
    end

    def enabled_notifications?
      Talkie.notifications_mentions_enabled?
    end

  end
end
