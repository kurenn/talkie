# frozen_string_literal: true

module Talkie
  class Comment < ActiveRecord::Base
    include Talkie::Mentionable if Talkie.mentions_enabled?

    default_scope Talkie.default_comments_scope

    acts_as_nested_set :scope => [:commentable_id, :commentable_type],
                       :counter_cache => :children_count

    belongs_to :creator, polymorphic: true, inverse_of: :comments
    belongs_to :commentable, polymorphic: true, inverse_of: :comments

    has_many :subscriptions, dependent: :destroy, inverse_of: :comment

    validates :body, :creator, :commentable, presence: true

    def replies
      @replies ||= descendants
    end
  end
end
