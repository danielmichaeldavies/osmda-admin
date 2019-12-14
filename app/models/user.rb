class User < ApplicationRecord
  has_secure_password

  include Authentication

  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..72 }, if: -> { password_digest.nil? }
end
