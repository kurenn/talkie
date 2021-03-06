# frozen_string_literal: true

module Talkie
  module ActsAsTalker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_talker
        class_eval do
          has_many :comments, as: :creator,
                              class_name: 'Talkie::Comment',
                              inverse_of: :creator

          has_many :subscriptions, as: :subscriber,
                                   class_name: 'Talkie::Subscription',
                                   dependent: :destroy,
                                   inverse_of: :subscriber

          scope :mentionees, Talkie.mentions_scope_query if Talkie.mentions_enabled?

          def owns_comment?(comment)
            self == comment.creator
          end
        end
      end

      alias_method :acts_as_commentator, :acts_as_talker
      alias_method :acts_as_speaker, :acts_as_talker
      alias_method :acts_as_commenter, :acts_as_talker
    end
  end
end

ActiveRecord::Base.send :include, Talkie::ActsAsTalker
