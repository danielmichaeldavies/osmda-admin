module SessionUtils
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :logged_in?
  end

  def logged_in?
    current_user
  end

  def current_user
    # If they have no session or session key or cookie then return nil
    return nil unless session[:user_id].present? && session[:authentication_token].present?

    # Find a user aslong as current user doesn't exist
    @current_user ||= User.find_by(id: session[:user_id],
                                   authentication_token: session[:authentication_token])

    # If we didnt find the user return nil
    return nil unless @current_user

    # Return the user
    @current_user
  end

  def sign_in(user, ip_address)
    user.ensure_authentication_token!(ip_address)

    session[:user_id] = user.id
    session[:authentication_token] = user.authentication_token

    @current_user = user
  end

  def sign_out(user)
    user&.update_column(:authentication_token, nil)

    session.delete(:user_id)
    session.delete(:authentication_token)
  end
end
