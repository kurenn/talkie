# frozen_string_literal: true

class TalkieController < ApplicationController
  include Talkie::Controller

  before_action :authorize!

  protected

  def authorize!
    if !current_permission.allow?(params[:action], current_comment)
      redirect_back fallback_location: main_app.root_url, status: :unauthorized
    end
  end

  def current_comment
    nil
  end
end
