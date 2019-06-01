class DummyUsersController < ApplicationController
  def show
    @dummy_user = DummyUser.find(params[:id])
  end
end
