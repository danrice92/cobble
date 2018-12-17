class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_login_link
      flash.notice = "Thanks for signing up! Your verification email has been sent."
      redirect_to root_path
    else
      render :sign_up
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email
    )
  end
end
