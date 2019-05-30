# frozen_string_literal: true

module Talkie
  module Controller
    extend ActiveSupport::Concern

    included do
      delegate :allow?, to: :current_permission
      helper_method :allow?
    end

    protected

    def current_permission
      @current_permission ||= Talkie::Permission.new(current_user)
    end
  end
end
