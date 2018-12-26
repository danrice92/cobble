class UserMailer < ApplicationMailer
  def sign_up_email
    @user = params[:user]
    @path = params[:path]
    mail(to: @user.email, subject: "Welcome to Novum Opus!")
  end

  def sign_in_email
    @user = params[:user]
    @path = params[:path]
    mail(to: @user.email, subject: "Sign in attempt to your Novum Opus account")
  end
end
