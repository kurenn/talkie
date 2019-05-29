class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= DummyUser.first
  end
end
