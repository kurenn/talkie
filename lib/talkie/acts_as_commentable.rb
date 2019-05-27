# frozen_string_literal: true

module Talkie
  module ActsAsCommentable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_commentable
        class_eval do
          has_many :comments, as: :commentable,
                              class_name: "Talkie::Comment",
                              inverse_of: :commentable
        end
      end

      alias_method :is_commentable, :acts_as_commentable
    end
  end
end

ActiveRecord::Base.send :include, Talkie::ActsAsCommentable
