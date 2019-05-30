module Talkie
  class ApplicationController < ::ApplicationController
    before_action :authorize!
    before_action :current_comment, only: [:destroy]

    delegate :allow?, to: :current_permission
    helper_method :allow?

    protected

    def current_permission
      @current_permission ||= Permission.new(current_user)
    end

    def authorize!
      if !current_permission.allow?(params[:action], current_comment)
        redirect_back fallback_location: main_app.root_url, status: :unauthorized
      end
    end

    def current_comment
      @current_comment ||= Talkie::Comment.find_by(params[:id])
    end
  end
end
