class ApplicationController < ActionController::Base
  before_action :login_required

  include SessionUtils

  private

  def login_required
    redirect_to login_path unless logged_in?
  end
end
