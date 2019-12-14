class Users::SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end
end
