class SessionsController < ApplicationController
  def new
    if @current_user
      redirect_to root_path, alert: "You are already signed in!"
    end
  end

  def create
    email = session_params[:email].to_s
    user = User.find_by_email email

    if !user
      redirect_to sign_in_path, alert: "Uh oh! We couldn't find that email. Please try again."
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
      redirect_to root_path, alert: "Oops, something went wrong. Please try again."
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

  private

  def session_params
    params.require(:session).permit(:email)
  end
end
