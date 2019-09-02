class SessionsController < ApplicationController
  def new
    if @current_user
      redirect_to root_path, alert: "You are already signed in."
    end
  end

  def create
    email = session_params[:email].to_s.downcase
    user = User.find_by_email email

    if !user
      redirect_to new_session_path, alert: "We could not find record of that email. Please try again or sign up first."
    else
      user.send_sign_in_link
      redirect_to root_path, notice: "We have sent you a login link. Please check your email."
    end
  end

  def destroy
    user = User.find params[:id]
    if user.email == session[:email]
      session.delete(:email)
      redirect_to root_path, notice: "You are now signed out."
    else
      redirect_to root_path, alert: "Sorry, something went wrong. Please try again."
    end
  end

  def auth
    user_id = params[:id]
    token = params[:token]
    user = User.find_by_id user_id

    if !user || !user.valid_token?(token)
      redirect_to root_path, alert: "That link was invalid. Please try signing in again."
    elsif user.auth_token_expired?
      redirect_to root_path, alert: "That link has expired. Please try signing in again."
    else
      sign_in_user user
      redirect_to new_consultation_path, notice: "You are now signed in."
    end
  end

  private

  def session_params
    params.require(:session).permit(:email)
  end

  def sign_in_user user
    session[:email] = user.email
  end
end
