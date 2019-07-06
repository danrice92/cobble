class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :set_current_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
   @current_user
  end

  private

  def user_not_authorized
   flash.alert = "You are not authorized to perform this action."
   redirect_to root_path
  end

  def set_current_user
   @current_user = User.find_by_email session[:email] if session[:email].present?
  end
end
