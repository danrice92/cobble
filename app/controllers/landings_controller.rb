class LandingsController < ApplicationController
  def index
    if @current_user
      @job_experiences = JobExperience.order("updated_at DESC")
      @title = JobExperience::INDEX_TITLE
    else
      @user = User.new
    end
  end
end
