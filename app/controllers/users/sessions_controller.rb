class Users::SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: allowed_params[:email])

    if @user&.authenticate(allowed_params[:password])
      sign_in(@user, request.remote_ip)

      redirect_to root_path
    else
      render_record_error(t('users.sessions.fail'))
    end
  end

  def destroy
    sign_out

    redirect_to root_path
  end

  private

  def render_record_error(text)
    @user = User.new(email: allowed_params[:email])
    @user.errors.add(:base, text)

    render :new
  end

  def allowed_params
    params.require(:user).permit(:email, :password)
  end
end
