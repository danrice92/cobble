class JobExperiencePolicy < ApplicationPolicy
  attr_reader :user, :job_experience

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    user.present?
  end
end
