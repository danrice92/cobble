class LandingsController < ApplicationController
  def index
    if @current_user.blank?
      @user = User.new
    end
  end
end
