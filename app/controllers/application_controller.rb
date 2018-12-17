class ApplicationController < ActionController::Base
  before_action :set_current_user

  def sign_in_user(user)
    user.expire_token!
    session[:email] = user.email
  end

  private

  def set_current_user
    @current_user = User.find_by_email session[:email] if session[:email].present?
  end
end
