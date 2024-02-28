class Employee < ApplicationRecord
  has_secure_password
  validates :jti, uniqueness: true
  before_create :generate_jti

  def generate_jti
    self.jti ||= SecureRandom.uuid
  end

  def generate_jwt
    JWT.encode({
      jti: self.jti,
      sub: self.id,
      scp: 'employee',
      iat: Time.now.to_i,
      exp: (Time.now+1.year).to_i
    }, Rails.application.credentials.fetch(:secret_key_base), 'HS256')
  end
end
