module Authentication
  extend ActiveSupport::Concern

  def ensure_authentication_token!
    self.authentication_token = generate_token(:authentication_token)
    self.last_sign_in_ip = current_sign_in_ip

    save
  end

  def ensure_confirmation_token!
    self.confirmation_token = generate_token(:confirmation_token)

    save
  end

  private

  def generate_token(column)
    loop do
      token = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
      break token unless User.find_by(column => token)
    end
  end
end
