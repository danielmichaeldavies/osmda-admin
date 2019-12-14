def user_login(user = nil)
  user ||= create(:user)
  user.ensure_authentication_token!

  session[:user_id] = user.id
  session[:authentication_token] = user.authentication_token
end
