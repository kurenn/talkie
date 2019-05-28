# frozen_string_literal: true

module Talkie
  module ActsAsCommentable
    extend ActiveSupport::Concern

    module InstanceMethods
      def root_parents
        comments.where(parent_id: nil)
      end
    end

    module ClassMethods
      def acts_as_commentable
        has_many :comments, as: :commentable,
                            class_name: "Talkie::Comment",
                            inverse_of: :commentable

        include Talkie::ActsAsCommentable::InstanceMethods
      end

      alias_method :is_commentable, :acts_as_commentable
    end
  end
end

ActiveRecord::Base.send :include, Talkie::ActsAsCommentable
