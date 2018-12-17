class UserMailer < ApplicationMailer
  def sign_up_email
    @user = params[:user]
    @path = params[:path]
    mail(to: @user.email, subject: "Welcome to Novum Opus!")
  end
end
