class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  validates :email, uniqueness: true, presence: true

  before_save :format_email

  def format_email
    self.email = self.email.delete(' ').downcase
  end

  def send_login_link
   self.auth_token = generate_token
   self.auth_token_created_at = Time.now.utc
   save!

   path = "http://localhost:3000/auth/#{self.id}?token=#{self.auth_token}"
   UserMailer.with(user: self, path: path).sign_up_email.deliver_now
  end

  def valid_token? param_token
    self.auth_token == param_token
  end

  def auth_token_expired?
   Time.now.utc > (self.auth_token_created_at + token_validity)
  end

  def expire_token!
   self.auth_token = nil
   save!
  end

  private

  def generate_token
   SecureRandom.base64(10)
  end

  def token_validity
   2.hours
  end
end
