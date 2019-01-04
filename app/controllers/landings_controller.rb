class LandingsController < ApplicationController
  def index
    @job_experiences = JobExperience.order("updated_at DESC")
    @user = User.new
  end
end
