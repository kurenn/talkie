# frozen_string_literal: true

module Talkie
  class Permission < Struct.new(:user)
    def allow?(action, comment)
      action = action.to_s

      if user
        return true if action.in? %w[create]
        return true if user.owns_comment?(comment) && action.in?(%w[destroy])
      end

      false
    end
  end
end
