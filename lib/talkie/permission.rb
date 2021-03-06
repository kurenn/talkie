# frozen_string_literal: true

module Talkie
  class Permission
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def comment_form_displayable?
      user.present?
    end

    def allow?(action, comment = Talkie::Comment.new)
      action = action.to_s

      if user
        return true if action.in? %w[create index]
        return true if action.in?(%w[destroy]) && user.owns_comment?(comment)
      end

      false
    end
  end
end
