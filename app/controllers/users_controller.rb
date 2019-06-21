class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_sign_up_link
      flash.notice = "Please check your email for a verification link to finish your registration."
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
