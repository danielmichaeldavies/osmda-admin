module Authentication
  extend ActiveSupport::Concern

  def ensure_authentication_token!(request_ip = '')
    self.authentication_token = generate_auth_token
    self.current_sign_in_ip = request_ip
    self.last_sign_in_ip = current_sign_in_ip

    save
  end

  private

  def generate_auth_token
    loop do
      token = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')

      break token unless User.exists?(authentication_token: token)
    end
  end
end
