# frozen_string_literal: true

module Talkie
  class Engine < ::Rails::Engine
    isolate_namespace Talkie

    initializer 'talkie_helpers.action_controller' do
      ActiveSupport.on_load :action_controller do
        helper Talkie::CommentsHelper
        include Talkie::Controller
      end
    end
  end
end
