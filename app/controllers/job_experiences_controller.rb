class JobExperiencesController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @job_experience = authorize JobExperience.new
  end

  def create
    @job_experience = authorize JobExperience.new job_experience_params
    if @job_experience.save
      flash.notice = "Your experience has been saved."
      redirect_to root_path
    else
      flash.alert = @job_experience.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @job_experience = authorize JobExperience.find params[:id]
  end

  def update
    @job_experience = authorize JobExperience.find params[:id]
    if @job_experience.update job_experience_params
      flash.notice = "This experience has been updated."
      redirect_to root_path
    else
      render :edit
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
      :website,
      :creator_id
    )
  end
end
