class UserExperiencesController < ApplicationController
  def index
    @job_experiences = @current_user.job_experiences.order("updated_at DESC")
  end
end
