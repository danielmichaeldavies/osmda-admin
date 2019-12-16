class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :login_required

  include SessionUtils

  private

  def login_required
    redirect_to login_path unless logged_in?
  end

  def not_found
    model_name = controller_name.classify

    redirect_to model_name.constantize, flash: { error: t('resources.not_found', resource: model_name) }
  end
end
