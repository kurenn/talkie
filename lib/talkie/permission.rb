# frozen_string_literal: true

module Talkie
  class Permission < Struct.new(:user)
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
