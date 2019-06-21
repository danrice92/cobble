class LandingsController < ApplicationController
  def index
    if @current_user
      puts "sup"
    else
      @user = User.new
    end
  end
end
