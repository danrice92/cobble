class UserMailer < ApplicationMailer
  def sign_up
    @user = params[:user]
    @path = params[:path]
    @sign_in_path = "http://#{ENV['MAILER_HOST']}/sessions/new"
    mail(to: @user.email, subject: "Welcome to Novum Opus!")
  end

  def sign_in
    @user = params[:user]
    @path = params[:path]
    mail(to: @user.email, subject: "Sign in attempt to your Novum Opus account")
  end
end
