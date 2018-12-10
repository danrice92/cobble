class JobExperiencesController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @job_experience = JobExperience.new
  end

  def create
    @job_experience = JobExperience.new job_experience_params
    if @job_experience.save
      flash.notice = "Your experience has been saved."
      redirect_to root_path
    else
      flash.alert = @job_experience.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def job_experience_params
    params.require(:job_experience).permit(
      :position,
      :company,
      :city,
      :state,
      :experience,
      :pay,
      :recommendation,
      :website
    )
  end
end
