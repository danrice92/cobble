class UsersController < ApplicationController
  invisible_captcha only: [:create], honeypot: :passcode, on_spam: :root_redirect

  def create
    @user = User.new user_params

    if @user.save
      @user.send_sign_up_link
      flash.notice = "Please check your email for a verification link to complete your registration."
      redirect_to root_path
    else
      redirect_to root_path, alert: "#{@user.errors.full_messages.to_sentence}."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def root_redirect
    redirect_to root_path, alert: "Silly bot!"
  end
end
