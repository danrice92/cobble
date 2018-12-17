class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email].to_s
    user = User.find_by_email email

    if !user
      redirect_to new_session_path, notice: "Uh oh! We couldn't find that email. Please try again."
    else
      user.send_login_link
      redirect_to root_path, notice: "We have sent you a login link. Please check your email."
    end
  end

  def auth
    user_id = params[:id]
    token = params[:token]
    user = User.find_by(id: user_id)

    if !user || !user.valid_token?(token)
      redirect_to root_path, notice: "It seems your link is invalid. Try requesting a new login link."
    elsif user.auth_token_expired?
      redirect_to root_path, notice: "Your login link has expired. Try requesting a new login link."
    else
      sign_in_user(user)
      redirect_to root_path, notice: "You have been signed in!"
    end
  end
end
