class JobExperiencesController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    render react_component: "NewJobExperience"
  end

  def create
    job_experience = JobExperience.new job_experience_params
    if job_experience.save
      puts "job experience saved: #{job_experience_params}"
      render json: job_experience
    else
      render json: { error: job_experience.full_messages.to_sentence }, status: 422
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
